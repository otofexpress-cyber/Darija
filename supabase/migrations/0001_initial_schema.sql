-- DARJIA WORLD: initial Supabase schema
-- Apply only to a new Supabase project after reviewing the migration.
-- This file creates schema objects; it does not connect or deploy a database.

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  preferred_locale text not null default 'en' check (preferred_locale in ('en','fr','ar','es','de')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.courses (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  title text not null,
  description text,
  level text not null default 'beginner' check (level in ('beginner','elementary','intermediate','advanced')),
  locale text not null default 'en' check (locale in ('en','fr','ar','es','de')),
  status text not null default 'draft' check (status in ('draft','review','published','archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.lessons (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references public.courses(id) on delete cascade,
  slug text not null,
  title text not null,
  summary text,
  body jsonb not null default '{}'::jsonb,
  sort_order integer not null default 0,
  status text not null default 'draft' check (status in ('draft','review','published','archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(course_id, slug)
);

create table if not exists public.vocabulary (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid references public.lessons(id) on delete cascade,
  darija_ar text not null,
  transliteration text not null,
  meaning text not null,
  example_ar text,
  example_transliteration text,
  example_translation text,
  locale text not null default 'en' check (locale in ('en','fr','ar','es','de')),
  review_status text not null default 'draft' check (review_status in ('draft','needs_review','approved')),
  created_at timestamptz not null default now()
);

create table if not exists public.lesson_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  status text not null default 'in_progress' check (status in ('in_progress','completed')),
  completion_percent integer not null default 0 check (completion_percent between 0 and 100),
  last_seen_at timestamptz not null default now(),
  completed_at timestamptz,
  primary key(user_id, lesson_id)
);

create table if not exists public.quiz_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  score integer not null check (score between 0 and 100),
  answers jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.certificates (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete restrict,
  verification_code text not null unique,
  issued_at timestamptz not null default now(),
  unique(user_id, course_id)
);

create index if not exists lessons_course_order_idx on public.lessons(course_id, sort_order);
create index if not exists vocabulary_lesson_idx on public.vocabulary(lesson_id);
create index if not exists quiz_attempts_user_created_idx on public.quiz_attempts(user_id, created_at desc);
create index if not exists certificates_verification_idx on public.certificates(verification_code);

alter table public.profiles enable row level security;
alter table public.courses enable row level security;
alter table public.lessons enable row level security;
alter table public.vocabulary enable row level security;
alter table public.lesson_progress enable row level security;
alter table public.quiz_attempts enable row level security;
alter table public.certificates enable row level security;

create policy "profiles_select_own" on public.profiles
  for select to authenticated using (auth.uid() = id);
create policy "profiles_insert_own" on public.profiles
  for insert to authenticated with check (auth.uid() = id);
-- Column-level grants should be used by the app for profile updates; role fields are intentionally absent.
create policy "profiles_update_own" on public.profiles
  for update to authenticated using (auth.uid() = id) with check (auth.uid() = id);

create policy "courses_read_published" on public.courses
  for select to anon, authenticated using (status = 'published');
create policy "lessons_read_published" on public.lessons
  for select to anon, authenticated using (
    status = 'published' and exists (
      select 1 from public.courses c where c.id = course_id and c.status = 'published'
    )
  );
create policy "vocabulary_read_approved" on public.vocabulary
  for select to anon, authenticated using (
    review_status = 'approved' and exists (
      select 1 from public.lessons l join public.courses c on c.id = l.course_id
      where l.id = lesson_id and l.status = 'published' and c.status = 'published'
    )
  );

create policy "progress_select_own" on public.lesson_progress
  for select to authenticated using (auth.uid() = user_id);
create policy "progress_insert_own" on public.lesson_progress
  for insert to authenticated with check (auth.uid() = user_id);
create policy "progress_update_own" on public.lesson_progress
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "quiz_attempts_select_own" on public.quiz_attempts
  for select to authenticated using (auth.uid() = user_id);
create policy "quiz_attempts_insert_own" on public.quiz_attempts
  for insert to authenticated with check (auth.uid() = user_id);

create policy "certificates_select_own" on public.certificates
  for select to authenticated using (auth.uid() = user_id);
create policy "certificates_insert_own" on public.certificates
  for insert to authenticated with check (auth.uid() = user_id);

-- No client-side write policies are provided for course authoring, vocabulary review,
-- certificate issuance, or moderation. These require trusted admin/server workflows.
