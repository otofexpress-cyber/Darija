# Architecture

## System boundaries
- **Web/PWA:** Next.js App Router, TypeScript, responsive UI, accessible navigation.
- **Identity and data:** Supabase Auth and PostgreSQL. Enable and test Row Level Security on every user-owned table before real user data is enabled.
- **AI:** server-only provider adapter. Keep API keys on the server; enforce authentication, quotas, input validation, timeouts, and cost controls.
- **Voice:** modular speech-to-text and text-to-speech adapters. Validate accuracy with native speakers and regional variants before claiming pronunciation accuracy.
- **Content:** reviewed curriculum and translation workflow with draft/review/published states and version history.
- **Community:** reports, blocking, moderation queue, rate limits, and safety policies before public posting is enabled.
- **Certificates:** free completion certificates with unique verification IDs; explicitly non-accredited.

## Request flow
Browser → Next.js route/server action → validation + authorization → feature service → Supabase/provider adapter → sanitized response.

## Internationalization
Target locales: en, fr, ar, es, de. Arabic uses RTL; other locales use LTR. Translation content is separately authored/reviewed and never assumed automatically accurate.

## Monetization boundaries
Free core learning and certificates. Optional premium AI allowances or specialist courses may be added after costs and payment availability are validated. Ads must not interrupt lessons, voice sessions, or assessments. Do not sell learner data.
