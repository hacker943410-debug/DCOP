# Contributing

## Workflow

1. Link every implementation change to a PRD, ADR, TASK, BUG, or RELEASE ID.
2. Keep changes minimal and reviewable.
3. Run local harness validation before opening a PR.
4. Use pull requests for changes to `main`.
5. Record agent usage, validation, risks, and next actions in the PR description.

## Prohibited Without Approval

- New production dependencies.
- Public API contract changes.
- Database migrations.
- Authentication, authorization, payment, deployment, or security policy changes.
- Production release or destructive operations.

## Validation

For the current bootstrap stage:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File scripts/validate-harness.ps1
```

Future app stacks will add lint, test, build, and browser validation commands after the Project Charter and Product Brief are approved.

