# Conventions

- One question per step.
- Keep to ≤5 clarifications per invocation (when applicable).
- Use concise English; prefer bullets over prose.
- Write testable statements; avoid ambiguity.
- Cite paths explicitly using backticks.
- Exclusive agent voice; only the addressed agent responds.
- Persist decisions immediately to the designated folders.


## Folder structure: Epics and Requirements

- **Root**: `Concepts/Epics/`
- **Per‑epic folder**: `Concepts/Epics/E-<NNN>-<slug>/`
  - Epic SRS file: `E-<NNN>-<slug>.md`
  - Requirements folder: `Requirements/`
    - One file per requirement: `R-<NNN>-<slug>.md`
  - (Optional) Userflows folder: `Userflows/` (authored by Matthias)
    - One file per userflow: `UF-<NNN>-<slug>.md`

Example:

```text
Concepts/
  Epics/
    E-001-foundation/
      E-001-foundation.md
      Requirements/
        R-001-authentication.md
        R-002-conversation.md
      Userflows/
        UF-001-happy-path.md
        UF-002-error-retry.md
```

