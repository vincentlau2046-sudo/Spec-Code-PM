# 增量规格 (Spec Delta)

## Feature: {{feature_name}}
## Delta ID: DELTA-{{delta_id}} (如 DELTA-001)
## 基于: {{base_spec_path}} (如 specs/{{feature_name}}/spec.md)
## 创建日期: {{delta_date}}

> 本文件记录对 `spec.md` 的增量变更。Phase 2 Specify 在增量模式下产出的差异规格。
> 增量 AC 编号规则: 在原编号后加 `.{{delta_id}}`（如 AC-1.DELTA-001）

## 变更摘要

| 类型 | 数量 | 说明 |
|------|------|------|
| 新增用户故事 | {{new_stories}} | 本次增量新增的故事 |
| 修改用户故事 | {{modified_stories}} | 已有故事被修改 |
| 废除用户故事 | {{deprecated_stories}} | 标记为过时 |
| 新增验收标准 | {{new_aces}} | 新增的 AC |
| 修改验收标准 | {{modified_aces}} | 已有 AC 被修改 |

## 新增用户故事 (New Stories)

| 故事 ID | 标题 | 优先级 | 验收标准 |
|---------|------|--------|----------|
| Story-{{new_story_id}} | {{story_title}} | P0/P1/P2 | 见下方 AC 表 |

### 新增验收标准

| AC ID | Given | When | Then | 类型 |
|-------|-------|------|------|------|
| AC-{{base_id}}.DELTA-{{delta_id}}-{{ac_num}} | {{given}} | {{when}} | {{then}} | new |

## 修改用户故事 (Modified Stories)

| 原故事 ID | 修改内容 | 修改原因 |
|-----------|----------|----------|
| Story-{{modified_story_id}} | {{modification}} | {{reason}} |

### 修改的验收标准

| 原 AC ID | 原 Then | 新 Then | 修改原因 |
|----------|---------|---------|----------|
| AC-{{ac_id}} | {{old_then}} | {{new_then}} | {{reason}} |

## 废除用户故事 (Deprecated Stories)

| 原故事 ID | 废除原因 | 替代方案 |
|-----------|----------|----------|
| Story-{{deprecated_story_id}} | {{reason}} | {{replacement}} |

## 影响域 (Impact Domain)

> 本次增量修改可能影响的已有功能模块/聚合/边界条件

| 影响对象 | 类型 | 影响描述 | 回归测试需求 |
|----------|------|----------|-------------|
| {{affected_aggregate_or_module}} | aggregate/feature/boundary | {{impact_description}} | yes/no |

## 与全量 spec.md 的关系

- `spec.md` 保持全量快照不变（不追加增量内容到 spec.md）
- `spec-delta.md` 记录本次增量变更
- Phase 8 Converge 时需对比 spec.md + spec-delta.md 的联合 AC 清单
- 多次增量时，delta 文件编号递增（DELTA-001, DELTA-002...）
