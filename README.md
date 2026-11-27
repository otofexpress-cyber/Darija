# DARJIA WORLD

**Speak Moroccan. Connect with Morocco.**  
*A language. A culture. A connection.*

DARJIA WORLD is a global, multilingual Moroccan Darija learning platform. This repository contains the first web scaffold, an introductory lesson, the initial database migration, and the implementation roadmap.

## Product decisions

- Web application + installable PWA; no separate native app in this phase.
- Languages: English, French, Arabic, Spanish, German.
- Arabic uses RTL; other languages use LTR.
- Zero-budget-first development; use free tiers where practical and disclose limits.
- AI tutor and voice practice are core features, implemented behind server-side provider adapters.
- Free learning-completion certificates; they are not accredited qualifications.
- Community features require reporting, blocking, and moderation safeguards.
- Balanced advertising only outside lessons, voice sessions, and assessments.
- Human review is required for translations and dialect-sensitive learning content.

## Planned technology

- Next.js App Router + TypeScript
- Tailwind CSS
- Supabase (PostgreSQL, Auth, Storage) after project credentials are configured
- Server-side AI provider adapter
- PWA support
- Vitest and Playwright

## Current implementation status

| Area | Status |
|---|---|
| Repository documentation and initial architecture | Added |
| Responsive landing page scaffold | Added; browser rendering not verified |
| Introductory Darija lesson and simple quiz | Added; linguistic content still needs native-speaker review |
| Supabase SQL schema and baseline RLS policies | Migration file added; not applied to a database |
| Supabase project connection | Not configured |
| AI tutor and speech services | Not connected or tested |
| Payments and advertising | Not configured |
| Production deployment | Not performed |
| Build, type checks, and automated tests | Not run |

## Local development

Requirements: Node.js 20.9+ and npm.

```bash
npm install
cp .env.example .env.local
npm run dev
```

Open http://localhost:3000.

The current app is an early preview. External services remain unavailable until configured.

## Safety and privacy principles

- Never expose service-role keys or AI provider keys to the browser.
- Validate and authorize all server-side mutations.
- Apply and test Supabase Row Level Security before enabling user data access.
- Do not sell learner data.
- Provide account data export and deletion workflows before public launch.
- Clearly label AI-generated feedback and unaccredited certificates.

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Roadmap](docs/ROADMAP.md)
- [Security checklist](docs/SECURITY.md)
- [Initial database migration](supabase/migrations/0001_initial_schema.sql)
- [Environment variables](.env.example)

## License

No open-source license has been selected yet. All rights remain with the repository owner unless a license is added.
