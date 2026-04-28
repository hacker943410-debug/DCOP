# Test Strategy

## Current Bootstrap Validation

The repository currently validates the operating harness, not an application runtime.

## Required Checks

- Required files exist.
- `.codex/**/*.toml` parses successfully.
- Custom agent files contain `name`, `description`, and `developer_instructions`.
- Spark dedup policy appears in `AGENTS.md`, PR template, and AI Work Log template.
- MCP surface in `orchestrator-policy.md` matches `codex mcp list`.
- Basic secret-pattern scanning passes.

## Future Checks

After stack selection, add lint, unit test, integration test, build, Playwright, accessibility, and release validation commands.

