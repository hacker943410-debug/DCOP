# AGENTS.md

## 1. MCP Defaults

- At the start of every Codex session, quickly inspect available MCP capabilities before substantive work.
- Prefer already exposed MCP tools when they are the direct or authoritative path for the task.
- Treat `Auth: Unsupported` in `codex mcp list` for `stdio` servers as expected. It means the server does not use bearer or OAuth auth.
- Relevant configured MCP servers for this project include `context7`, `memory`, `notion`, `playwright`, `e2b`, and `sequential_thinking`.
- If an MCP call fails, report the server, the known reason, and the fallback source.

## 2. Working Agreement

- Keep changes minimal and reviewable.
- Do not introduce new production dependencies without approval.
- Do not modify authentication, payment, database migration, deployment, or security policy logic without explicit human approval.
- Always reference a related PRD, ADR, TASK, BUG, or RELEASE ID when making implementation changes.
- Every implementation summary must include changed files, validation commands, results, risks, and next action.

## 3. Main Orchestrator Delegation Authority

The main orchestrator is pre-authorized to use configured subagents when useful. The user does not need to explicitly request subagent usage for every task.

The orchestrator may delegate to subagents for:

- codebase mapping
- product planning
- architecture review
- frontend, backend, mobile, and AI implementation support
- Spark-based small UI iteration
- Playwright UI validation
- screenshot-based visual review
- QA and test drafting
- security review
- release review
- documentation and changelog updates

The orchestrator must report planned and completed subagent work with:

- task name
- subagent name
- model
- reasoning effort
- sandbox or permission level
- expected or produced output
- review or validation status

## 4. Spark Review Deduplication Policy

When `spark_ui_iterator` using `gpt-5.3-codex-spark` performs a small UI or coding iteration:

- Do not run an additional GPT-5.5 code review for the same diff.
- Mark GPT-5.5 review as `OFF_BY_POLICY`.
- Record Spark review status in the report.
- Escalate only when high-risk files are touched, tests fail, or the diff exceeds the agreed small-change scope.

High-risk files include:

- authentication
- authorization
- payment
- database migrations
- API contracts
- deployment, CI, or CD
- secrets or environment configuration
- security policies

## 5. Validation

Run relevant commands before reporting completion. The current bootstrap validation command is:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File scripts/validate-harness.ps1
```

When an app stack is added, include its lint, test, build, and browser validation commands in the relevant docs.

## 6. Documentation Rules

- Update PRD documents when product behavior changes.
- Create or update ADRs when architecture, API contract, database schema, dependency strategy, or infrastructure changes.
- Update release notes when production behavior changes.
- Update `AGENTS.md` when repeated mistakes or recurring review feedback appears.
- Update generated asset logs when GPT Image 2 creates project assets or design directions.

## 7. Prohibited Actions

- Do not commit secrets.
- Do not log sensitive user data.
- Do not change public API contracts without an ADR.
- Do not perform destructive database operations without a rollback plan.
- Do not mark a task complete without validation evidence.
- Do not allow Spark or mini agents to make final decisions on architecture, security, database, payment, or release readiness.

## 8. Reporting Format

After each task, report:

1. Summary
2. Subagent delegation plan or execution result if any
3. Changed files
4. Validation performed
5. Spark review deduplication status if Spark was used
6. Risks or assumptions
7. Next recommended action

