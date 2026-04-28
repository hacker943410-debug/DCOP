# Known Agent Mistakes

| Date | Problem | Agent | Cause | Prevention | Reflected In |
|---|---|---|---|---|---|
| 2026-04-28 | Duplicate GPT-5.5 review after Spark small diff | main_orchestrator | Missing dedup policy | Mark GPT-5.5 review `OFF_BY_POLICY` | `AGENTS.md`, PR template |
| 2026-04-28 | Missing subagent report details | main_orchestrator | Report template skipped | Include model, reasoning, permission, output | `AGENTS.md` |
| 2026-04-28 | Spark touches high-risk files | spark_ui_iterator | Scope not enforced | Stop and escalate | `spark-ui-iterator.toml` |

