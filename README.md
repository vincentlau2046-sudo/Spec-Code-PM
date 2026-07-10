# Spec-Code-PM

> **DDD-Driven Project Management as a Prompt Pipeline**
>
> 10 phases. Pure Markdown. Zero scripts. End-to-end traceability from constitution to release.

[![OpenClaw Skill](https://img.shields.io/badge/OpenClaw-Skill-blue)](https://github.com/openclaw/openclaw) [![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE) [![Version](https://img.shields.io/badge/version-0.9.0-orange)]()

## Philosophy

> *"A specification is not documentation. It is the source of truth."*

Spec-Code-PM fuses **Spec-Driven Development**, **Domain-Driven Design (DDD)**, and **Test-Driven Design (TDD)** into a single, end-to-end management pipeline. Every decision — from project constitution to release summary — is captured as a traceable Markdown artifact.

No frameworks. No CLI dependencies. No build tools. Just prompts + templates that any AI agent can execute.

## What It Solves

| Pain Point | Spec-Code-PM Approach |
|------------|----------------------|
| Specs become stale | Spec is the **source** — every downstream artifact traces back to it |
| DDD modeling is disconnected from code | Domain model → tech plan → task breakdown → implementation report — one chain |
| Testing is an afterthought | **D.x/T.x Dual-Track**: Design and Test advance together within each phase |
| Incremental changes break traceability | **Delta system**: `spec-delta`, `design-delta`, `test-strategy-delta` — all linked by `delta_id` |
| Agent workflows are ad-hoc | 10 structured phases with quality gates, no guesswork |

## 10-Phase Workflow

```
Phase 0  Constitution  ── Project governance (quality bars, tech constraints)
Phase 1  Context        ── Product vision + ubiquitous language + bounded context
Phase 2  Specify        ── User stories + acceptance criteria (greenfield or delta)
Phase 3  Clarify        ── Ambiguity resolution + edge cases
Phase 4  Design         ── DDD tactical model + tech plan + test strategy (T.4)
Phase 5  Analyze        ── Cross-artifact validation gate + test completeness (T.5)
Phase 6  Tasks          ── Atomic task breakdown with test-basis binding (T.6)
Phase 7  Implement     ── TDD Iron Law enforcement + coding agent delegation
Phase 8  Converge       ── Realize vs spec alignment + test quality gates (T.8)
Phase 9  Release        ── Multi-feature milestone aggregation
```

### D.x / T.x Dual-Track

Each phase runs on two parallel tracks:

| Track | Focus | Phases |
|-------|-------|--------|
| **D.x** (Design/Dev) | Domain modeling, architecture, task decomposition | 2, 4, 6, 7 |
| **T.x** (Test/Verify) | Test strategy, completeness, iron law, quality gates | 4, 5, 6, 7, 8 |

**TDD Iron Law**: _No production code without a failing test first._ The main session verifies RED before releasing GREEN.

### Incremental Development

Greenfield features start fresh. Incremental features use the **delta system**:

```
spec-delta-001.md  ←── delta_id linkage ──→ design-delta-001.md
                                            test-strategy-delta-001.md
```

Incremental ACs follow the naming convention: `AC-3.DELTA-001-1` (base.delta.sequence), ensuring full traceability back to the original spec.

## Quick Start

### As an OpenClaw Skill

```bash
# Clone into your skills directory
cp -r spec-code-pm ~/.openclaw/workspace/skills/spec-code-pm
```

### As a Standalone Workflow

```bash
# Initialize a project
spec-pm constitution       # Phase 0: governance
spec-pm init               # Phase 1: DDD context

# Feature lifecycle
spec-pm spec user-auth     # Phase 2: specify
spec-pm design user-auth   # Phase 4: DDD design
spec-pm tasks user-auth    # Phase 6: task breakdown
spec-pm implement user-auth # Phase 7: execute
spec-pm converge user-auth # Phase 8: quality gate
```

## Architecture

```
skills/spec-code-pm/
├── SKILL.md                  # Master skill definition
├── scripts/
│   └── init-project.sh       # Project bootstrap (creates .specpmrc)
├── assets/
│   ├── phases/             # 10 phase prompts (phase-0 through phase-9)
│   └── templates/          # 19 artifacts (spec, model, delta, strategy...)
└── references/             # DDD tactical + spec-kit comparison
```

### Pure Markdown Architecture

- **Zero scripts** — the entire workflow runs on prompt + template
- **Zero external dependencies** — no npm, no pip, no CLI tools
- **Every decision is a file** — traceable, diffable, versionable

## Quality Gates

| Gate | Phase | Criteria |
|------|-------|----------|
| Constitution Check | 5 | Tech plan complies with governance principles |
| Cross-Artifact Validation | 5 | spec ↔ model ↔ plan consistency (P0 blocks) |
| Test Completeness | 5 | Every aggregate/event/VO has test coverage plan |
| TDD Iron Law | 7 | RED → GREEN cycle enforced per task |
| Convergence Gate | 8 | AC pass rate ≥ 90%, scope creep < 10% |

## Design Principles

1. **Spec as Source**: The specification is the single source of truth. Everything derives from it.
2. **Dual-Track Design**: Design and test advance in lockstep, never as afterthoughts.
3. **Atomic Tasks**: Every task ≤ 8 hours, single-agent deliverable, traceable to a specific AC.
4. **Delta Orthogonality**: Incremental and greenfield are orthogonal concerns — they stack cleanly.
5. **Artifact-Driven**: If it isn't in a file, it doesn't exist.

## References

- [Spec Kit](https://github.com/simonw/spec-kit) — Phase-driven spec workflow
- [Disciplined Agentic Engineering](https://github.com/swingerman/disciplined-agentic-engineering) — ATDD pipeline
- [Superpowers](https://github.com/obra/superpowers) — TDD Iron Law

## License

MIT