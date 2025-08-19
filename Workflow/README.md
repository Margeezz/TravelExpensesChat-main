# Workflow

Goal: Inputs → Epics → granular, testable requirements. Concise. Decision‑driven.

Contents:
- `MasterAgent.md` – orchestration, rules, triggers, boundaries.
- `Conventions.md` – shared writing rules (concise, one‑question‑per‑step, English).
- `config.yaml` – paths and per‑agent settings (single source of truth).
- `Agents/` – agent‑specific roles and processes.
- `Templates/` – minimal templates (Epic, Requirement, Review, Review_CrossFunctional, MarketBrief, Userflow).

Sources:
- `Inputs/` → `Vision.md`, optional `Files/`

Principles:
- Only essentials; minimal wording.
- Exclusive agent activation by user prefix; see `MasterAgent.md`.

Agents:
- Stefan (Product), Paulina (Requirements), Matthias (UI/UX – Userflows), ReviewTeam (Review), Exporter (Export), Marktsepp (Market Research & Vision)

Start:
1) Place inputs under `Inputs/`.
2) Trigger an agent by prefix in chat (e.g., `Stefan:`).
3) For userflows after requirements, trigger `Matthias:` and specify the epic.
4) For cross‑functional review, run `./Workflow/scripts/prepare_crossfunctional_review.ps1` and have each persona fill findings.

