# DARJIA WORLD

**Speak Moroccan. Connect with Morocco.**  
*A language. A culture. A connection.*

DARJIA WORLD is a global, multilingual Moroccan Darija learning platform. This repository contains the initial application scaffold and implementation plan.

## Product decisions

- Web application + installable PWA; no separate native app in this phase.
- Languages: English, French, Arabic, Spanish, German.
- Arabic uses RTL; other languages use LTR.
- Zero-budget-first development; use free tiers where practical and disclose limits.
- AI tutor and voice practice are core features, implemented behind server-side provider adapters.
- Free learning-completion certificates. They are not accredited qualifications.
- Community features with reporting, blocking, and moderation safeguards.
- Balanced advertising only outside lessons, voice sessions, and assessments.
- Human review is required for translations and dialect-sensitive learning content.

## Planned technology

- Next.js App Router + TypeScript
- Tailwind CSS
- Supabase (PostgreSQL, Auth, Storage) when credentials are configured
- Server-side AI provider adapter
- PWA support
- Vitest and Playwright

## Current implementation status

This repository is being initialized. A scaffold is not the same as a production-ready service.

| Area | Status |
|---|---|
| Project documentation and architecture | In progress |
| Application scaffold | In progress |
| Database schema and RLS policies | Planned |
| Supabase project connection | Not configured |
| AI provider connection | Not configured |
| Speech-to-text / text-to-speech | Not configured or tested |
| Payments and advertising | Not configured |
| Production deployment | Not performed |
| Automated tests | Not run unless explicitly reported |

## Local development

Requirements: Node.js 20.9+ and npm.

```bash
npm install
cp .env.example .env.local
npm run dev
```

Open http://localhost:3000.

The app should run in demo-safe mode without external credentials. Features requiring Supabase or an AI provider remain unavailable until configured.

## Safety and privacy principles

- Never expose service-role keys or AI provider keys to the browser.
- Validate and authorize all server-side mutations.
- Apply Supabase Row Level Security before enabling user data access.
- Do not sell learner data.
- Provide account data export and deletion workflows before public launch.
- Clearly label AI-generated feedback and unaccredited certificates.

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Roadmap](docs/ROADMAP.md)
- [Security checklist](docs/SECURITY.md)
- [Environment variables](.env.example)

## License

No open-source license has been selected yet. All rights remain with the repository owner unless a license is added.
