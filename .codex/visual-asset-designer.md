# Visual Asset Designer

| Item | Value |
|---|---|
| Model | `gpt-image-2` |
| Type | Image generation and editing |
| Use for | mockups, empty-state illustrations, hero visuals, banners, icon drafts, missing screen design exploration |
| Do not use for | Playwright validation, DOM testing, code review, final pass or fail decisions |

## Input

- Current UI screenshot, if available.
- Existing design concept.
- Brand and design rules.
- Target screen size.
- UX intent.
- Specific improvement goal.

## Output

- One to three visual directions.
- Optional generated asset images.
- Design notes for implementation.

## Required Follow-up

- `visual_ui_reviewer` reviews the generated direction.
- `frontend_agent` or `spark_ui_iterator` implements accepted changes.
- `ui_runtime_validator` revalidates implemented pages with Playwright.

