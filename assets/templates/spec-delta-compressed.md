# Incremental Change Merge Summary — {feature} {date}
> Merged from delta-{min_id} ~ delta-{max_id}
> Archived originals in .history/pre-{date}/ for audit.
> Next delta ID continues from {next_id} (not reset).

## Active Changes (by aggregate)

| Delta ID | Scope | Change | Rationale | References | Supersedes |
|----------|-------|--------|-----------|------------|-----------|
| {id} | spec | {change} | {reason} | {ref_ids} | {old_ids} |

## Current Effective State (all active deltas applied)

- {field}: {type}, {constraint}
- {rule}: {description}

## Archive Summary
- Files archived: {count} ({min_id} ~ {max_id})
- Original total: {orig_size} → Compressed: {comp_size} ({reduction}% reduction)
- Next delta ID: {next_id}

## Decompression
```
spec-pm decompress-trajectory {feature}
```
Moves .history/ files back to specs/{feature}/ and removes compressed file.