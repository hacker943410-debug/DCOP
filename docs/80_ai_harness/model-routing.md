# Model Routing

| Work | Primary Model or Agent | Notes |
|---|---|---|
| Planning and architecture | `gpt-5.5` | Use high reasoning when needed |
| Implementation | `gpt-5.5` | Default Codex worker |
| Lightweight exploration | `gpt-5.4-mini` | Read-only or limited write |
| Deep code review | `gpt-5.3-codex` | Read-only |
| Small UI/coding iteration | `gpt-5.3-codex-spark` | Spark dedup policy applies |
| Image or mockup generation | `gpt-image-2` | Not a validator |

