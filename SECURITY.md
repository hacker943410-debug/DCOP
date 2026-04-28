# Security Policy

## Reporting

Do not open public issues for vulnerabilities or secrets exposure. Contact the repository owner directly and include:

- affected area
- reproduction steps
- impact assessment
- suggested remediation, if known

## Current State

This repository is in bootstrap. No production system, database, auth provider, payment provider, or deployment target is active yet.

## Guardrails

- Do not commit secrets, tokens, private keys, or user data.
- Do not log sensitive user data.
- Do not change authentication, authorization, payment, database migration, deployment, or security policy logic without explicit human approval.
- Public API contract changes require an ADR before implementation.

