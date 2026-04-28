# Threat Model

## Status

Initial placeholder. No production surface exists yet.

## Current Risks

- Public repository could expose secrets if guardrails fail.
- Future auth, payment, database, or deployment changes require explicit review.

## Controls

- `.gitignore` excludes env files and common secret material.
- CI performs basic secret-pattern scanning.
- `security_reviewer` is required for sensitive changes.

