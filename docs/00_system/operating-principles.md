# Operating Principles

## Principles

- Documentation controls execution, not the other way around.
- Every implementation task links to a PRD, ADR, TASK, BUG, or RELEASE ID.
- Keep changes small, reviewable, and validated.
- Human approval is required for high-risk areas.
- Subagents may be used automatically when they improve speed, safety, or clarity.
- Spark is limited to small, bounded UI or coding iterations.

## High-Risk Areas

- Authentication and authorization.
- Payments.
- Database migrations.
- Public API contracts.
- Secrets and environment configuration.
- CI/CD and production deployment.
- Security policy.

