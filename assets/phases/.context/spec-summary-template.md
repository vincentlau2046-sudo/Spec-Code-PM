# spec-summary template — Layer 2 Semantic Summarization
# Generated automatically by Phase 5 (Analyze) or on-demand
# Stored in specs/<name>/.cache/spec-summary.md
# Format: structured markdown, optimized for Coding Agent consumption
#
# Generation trigger: end of Phase 5 (Analyze) when compress=true
# Regeneration: any time spec.md / domain-model.md changes after Phase 5

template: |
  # {feature_name} — Context Summary
  > Auto-generated. Source: spec.md + domain-model.md
  > Last updated: {date}

  ## Domain Boundary
  - Aggregates: {list from domain-model}
  - Entities: {list}
  - Core Invariants: {rules}

  ## Acceptance Criteria (Boundary Cases Only)
  | ID | Given | When | Then | Priority |
  |----|-------|------|------|----------|
  | AC-1 | ... | ... | ... | P0 |

  ## Key Decisions (Last 3)
  - {date}: {decision} — {reason}

  ## Delta Chain (Last 3)
  - #{id}: {scope} — {impact} {date}

# Quality gate: AC recall rate must >= 80% of original
# If summary generation fails → fallback to full spec.md