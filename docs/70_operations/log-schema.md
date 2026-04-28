# Log Schema

## Rules

- Do not log secrets, API keys, tokens, passwords, or sensitive user data.
- Use structured logs after a runtime stack is selected.
- Include request IDs or correlation IDs where appropriate.

## Template

| Field | Type | Required | Notes |
|---|---|---:|---|
| timestamp | string | Yes | ISO 8601 |
| level | string | Yes | info, warn, error |
| message | string | Yes | No sensitive data |
| correlation_id | string | Recommended | Trace requests |

