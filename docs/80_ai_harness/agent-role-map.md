# Agent Role Map

| Agent | Model | Reasoning | Permission | Purpose |
|---|---|---|---|---|
| `product_planner` | `gpt-5.5` | high | read-only | PRD, MVP, user flows |
| `project_manager` | `gpt-5.5` | medium | read-only | tasks, risks, reporting |
| `architect_reviewer` | `gpt-5.5` | high | read-only | architecture and ADR review |
| `codebase_mapper` | `gpt-5.4-mini` | medium | read-only | code and doc mapping |
| `frontend_agent` | `gpt-5.5` | medium | workspace-write | web UI implementation |
| `spark_ui_iterator` | `gpt-5.3-codex-spark` | low | workspace-write | small UI/coding iteration |
| `ui_runtime_validator` | `gpt-5.4-mini` | medium | workspace-write | Playwright validation |
| `visual_ui_reviewer` | `gpt-5.5` | high | read-only | screenshot design review |
| `code_reviewer` | `gpt-5.3-codex` | high | read-only | deep code review |
| `security_reviewer` | `gpt-5.5` | high | read-only | security and privacy review |
| `backend_agent` | `gpt-5.5` | high | workspace-write | backend implementation |
| `db_reviewer` | `gpt-5.5` | high | read-only | schema and migration review |
| `mobile_agent` | `gpt-5.5` | medium | workspace-write | mobile implementation |
| `ai_integration_agent` | `gpt-5.5` | high | workspace-write | AI API and RAG implementation |
| `devops_sre_reviewer` | `gpt-5.5` | high | read-only | CI/CD and operations review |
| `qa_agent` | `gpt-5.4-mini` | medium | workspace-write | QA and tests |
| `release_reviewer` | `gpt-5.5` | high | read-only | release readiness |
| `docs_release_manager` | `gpt-5.4-mini` | low | workspace-write | docs and release notes |

