# Security checklist

- [ ] Keep all service-role and AI provider keys server-side.
- [ ] Validate all input at API boundaries.
- [ ] Enforce authentication and authorization for protected operations.
- [ ] Enable and test RLS for every user-data table.
- [ ] Add rate limits and AI usage budgets.
- [ ] Sanitize user-generated content and moderate public submissions.
- [ ] Configure secure sessions and account recovery.
- [ ] Implement data export and deletion.
- [ ] Publish privacy, terms, cookie, and community safety policies before public launch.
- [ ] Review dependencies and run security checks before deployment.

Do not store secrets in Git. Use a local environment file for development and hosting-provider secret settings for deployment.
