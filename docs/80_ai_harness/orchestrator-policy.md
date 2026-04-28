# Orchestrator Policy

## MCP Surface

The current session reported these MCP servers:

| Server | Status | Auth Notes |
|---|---|---|
| `e2b` | enabled | `Auth: Unsupported` is expected for stdio |
| `memory` | enabled | `Auth: Unsupported` is expected for stdio |
| `notion` | enabled | `Auth: Unsupported` is expected for stdio |
| `playwright` | enabled | `Auth: Unsupported` is expected for stdio |
| `sequential_thinking` | enabled | `Auth: Unsupported` is expected for stdio |
| `context7` | enabled | OAuth |

## Rules

- Inspect MCP capabilities at the start of each Codex session.
- Prefer MCP tools over shell or web lookups when they are more direct.
- Use `context7` for current technical documentation when applicable.
- Use `playwright` for browser validation when UI exists.
- Use `memory` only for relevant project memory.
- Use `notion` only when Notion context is explicitly relevant.
- Use `e2b` only when isolated execution is needed.
- Use `sequential_thinking` only for complex reasoning that benefits from explicit steps.

## Delegation

The orchestrator may delegate automatically to configured subagents when useful, then integrate results into one final report.

## Human Approval Required

- Public API contract changes.
- Database migrations.
- Authentication or authorization changes.
- Payment changes.
- Production deployment.
- Security policy changes.

