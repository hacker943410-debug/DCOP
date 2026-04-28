$ErrorActionPreference = "Stop"

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $RepoRoot

function Resolve-Python311 {
  $candidates = @()

  foreach ($name in @("python", "python3")) {
    $command = Get-Command $name -ErrorAction SilentlyContinue
    if ($command) {
      $candidates += $command.Source
    }
  }

  if ($env:USERPROFILE) {
    $codexPython = Join-Path $env:USERPROFILE ".cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
    if (Test-Path $codexPython) {
      $candidates += $codexPython
    }
  }

  foreach ($candidate in ($candidates | Select-Object -Unique)) {
    $isSupported = & $candidate -c "import sys; raise SystemExit(0 if sys.version_info >= (3, 11) else 1)" 2>$null
    if ($LASTEXITCODE -eq 0) {
      return $candidate
    }
  }

  throw "Python 3.11+ is required for TOML validation."
}

$pythonExe = Resolve-Python311

$validationScript = @'
import os
import re
import sys
import tomllib
from pathlib import Path

root = Path.cwd()
errors = []

required_files = [
    "AGENTS.md",
    "README.md",
    "CHANGELOG.md",
    "CODEOWNERS",
    ".gitignore",
    ".editorconfig",
    "SECURITY.md",
    "CONTRIBUTING.md",
    ".codex/config.toml",
    ".codex/visual-asset-designer.md",
    ".github/PULL_REQUEST_TEMPLATE.md",
    ".github/ISSUE_TEMPLATE/feature.md",
    ".github/ISSUE_TEMPLATE/bug.md",
    ".github/ISSUE_TEMPLATE/incident.md",
    ".github/workflows/harness-checks.yml",
    "docs/00_system/project-charter.md",
    "docs/10_product/product-brief.md",
    "docs/20_architecture/architecture-overview.md",
    "docs/50_quality/test-strategy.md",
    "docs/60_release/release-checklist.md",
    "docs/70_operations/runbook.md",
    "docs/80_ai_harness/orchestrator-policy.md",
    "docs/80_ai_harness/model-routing.md",
    "docs/80_ai_harness/agent-role-map.md",
    "docs/80_ai_harness/ai-work-log.md",
    "docs/80_ai_harness/spark-review-deduplication-policy.md",
    "docs/80_ai_harness/known-agent-mistakes.md",
]

for rel in required_files:
    if not (root / rel).is_file():
        errors.append(f"Missing required file: {rel}")

toml_files = sorted((root / ".codex").rglob("*.toml"))
if not toml_files:
    errors.append("No TOML files found under .codex")

for path in toml_files:
    try:
        with path.open("rb") as handle:
            tomllib.load(handle)
    except Exception as exc:
        errors.append(f"TOML parse failed for {path.relative_to(root)}: {exc}")

agent_files = sorted((root / ".codex" / "agents").glob("*.toml"))
if len(agent_files) != 18:
    errors.append(f"Expected 18 custom agent files, found {len(agent_files)}")

for path in agent_files:
    with path.open("rb") as handle:
        data = tomllib.load(handle)
    for field in ("name", "description", "developer_instructions"):
        if field not in data or not str(data[field]).strip():
            errors.append(f"{path.relative_to(root)} missing required field: {field}")

spark_policy_files = [
    "AGENTS.md",
    ".github/PULL_REQUEST_TEMPLATE.md",
    "docs/80_ai_harness/ai-work-log.md",
    "docs/80_ai_harness/spark-review-deduplication-policy.md",
]
for rel in spark_policy_files:
    text = (root / rel).read_text(encoding="utf-8")
    if "OFF_BY_POLICY" not in text or "gpt-5.3-codex-spark" not in text:
        errors.append(f"Spark dedup policy incomplete in {rel}")

orchestrator = (root / "docs/80_ai_harness/orchestrator-policy.md").read_text(encoding="utf-8")
for server in ("e2b", "memory", "notion", "playwright", "sequential_thinking", "context7"):
    if f"`{server}`" not in orchestrator:
        errors.append(f"MCP server missing from orchestrator policy: {server}")

secret_patterns = {
    "OpenAI API key": re.compile(r"sk-[A-Za-z0-9_-]{20,}"),
    "GitHub token": re.compile(r"(ghp|gho|github_pat)_[A-Za-z0-9_]{20,}"),
    "AWS access key": re.compile(r"AKIA[0-9A-Z]{16}"),
    "Private key block": re.compile(r"-----BEGIN [A-Z ]*PRIVATE KEY-----"),
}
scan_suffixes = {".md", ".toml", ".yml", ".yaml", ".ps1", ".gitignore", ".editorconfig"}
skip_parts = {".git"}
for path in root.rglob("*"):
    if not path.is_file():
        continue
    if any(part in skip_parts for part in path.parts):
        continue
    if path.suffix not in scan_suffixes and path.name not in {"CODEOWNERS"}:
        continue
    text = path.read_text(encoding="utf-8", errors="ignore")
    for label, pattern in secret_patterns.items():
        if pattern.search(text):
            errors.append(f"Potential secret pattern detected ({label}) in {path.relative_to(root)}")

if errors:
    print("Harness validation failed:")
    for error in errors:
        print(f"- {error}")
    sys.exit(1)

print("Harness validation passed.")
print(f"Validated TOML files: {len(toml_files)}")
print(f"Validated custom agents: {len(agent_files)}")
'@

$validationScript | & $pythonExe -
