# Spark Review Deduplication Policy

## Policy

For small diffs owned by `spark_ui_iterator` using `gpt-5.3-codex-spark`, do not run an additional GPT-5.5 code review for the same diff.

Report:

- Spark used: Yes
- Spark model: `gpt-5.3-codex-spark`
- Spark review status
- GPT-5.5 additional code review: `OFF_BY_POLICY`
- Escalation trigger: None, or the specific trigger

## Escalation Triggers

- Auth or authorization files touched.
- Payment files touched.
- Database migrations touched.
- Public API contracts changed.
- CI/CD, deployment, secret, or security policy files changed.
- Tests or build fail.
- Scope expands beyond a small bounded iteration.

