# DCOP

DCOP is currently in project bootstrap. This repository contains the operating harness that will govern planning, implementation, review, validation, release, and operations before application code is introduced.

## Current Scope

- App scaffolding: not created yet.
- Database, auth, payment, and deployment platform: not selected yet.
- First milestone: complete the Codex operating harness and project baseline documents.

## Harness Contents

- `AGENTS.md`: project working agreement and Codex orchestration rules.
- `.codex/config.toml`: project-scoped Codex model, sandbox, approval, and profile configuration.
- `.codex/agents/`: custom subagent role definitions.
- `docs/`: product, architecture, design, delivery, quality, release, operations, and AI harness records.
- `.github/`: PR, issue, and harness validation workflow templates.

## Development Readiness

Before implementation work starts, the team should complete:

- `docs/00_system/project-charter.md`
- `docs/10_product/product-brief.md`
- `docs/20_architecture/architecture-overview.md`
- `docs/50_quality/test-strategy.md`
- `docs/60_release/release-checklist.md`
- `docs/70_operations/runbook.md`

## Local Validation

Run the harness checks before opening a PR:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File scripts/validate-harness.ps1
```

The workflow in `.github/workflows/harness-checks.yml` runs the same validation in CI.

