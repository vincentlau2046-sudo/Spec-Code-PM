# 增量设计 (Design Delta)

## Feature: {{feature_name}}
## Delta ID: DELTA-{{delta_id}}
## 基于: {{base_model_path}} (如 specs/{{feature_name}}/domain-model.md)
## 创建日期: {{delta_date}}

> 本文件记录对领域模型和技术计划的增量变更。Phase 4 Design 在增量模式下产出的差异设计。
> delta 与 spec-delta.md 的 DELTA-{{delta_id}} 保持编号一致。

## 领域模型变更

### 新增聚合 (New Aggregates)

| 聚合名 | 不变约束 | 关联故事 | 关联 AC |
|--------|----------|----------|---------|
| {{new_aggregate}} | {{invariant}} | Story-{{story_id}} | AC-{{ac_id}} |

### 修改聚合 (Modified Aggregates)

| 聚合名 | 变更类型 | 变更描述 | 影响已有约束 |
|--------|----------|----------|-------------|
| {{modified_aggregate}} | add_entity/remove_entity/modify_invariant/... | {{description}} | yes/no |

### 新增实体/值对象/事件

| 类型 | 名称 | 描述 | 关联 AC |
|------|------|------|---------|
| entity/vo/event | {{name}} | {{description}} | AC-{{ac_id}} |

### 废弃元素 (Deprecated Elements)

| 类型 | 名称 | 废弃原因 | 替代方案 |
|------|------|----------|----------|
| entity/vo/event | {{name}} | {{reason}} | {{replacement}} |

## 技术计划变更

### 新增 ADR

| ADR ID | 标题 | 状态 | 背景 | 决策 | 后果 |
|--------|------|------|------|------|------|
| ADR-{{adr_id}} | {{title}} | accepted | {{context}} | {{decision}} | {{consequence}} |

### 修改 ADR

| 原 ADR ID | 修改内容 | 修改原因 |
|-----------|----------|----------|
| ADR-{{old_adr_id}} | {{modification}} | {{reason}} |

### 基础设施变更

| 组件 | 变更类型 | 描述 | 影响范围 |
|------|----------|------|----------|
| {{component}} | add/remove/modify | {{description}} | {{scope}} |

## 测试策略增量 (test-strategy-delta.md 联动)

> 增量测试策略与 test-strategy-delta.md 保持同步。此处列出关键映射，详细见 delta 测试策略文件。

| 变更类型 | 测试影响 | test-strategy-delta 映射 |
|----------|----------|--------------------------|
| 新增聚合 {{agg}} | 新增 unit test: {{test}} | test-strategy-delta.md §1.{{test}} |
| 修改聚合 {{agg}} | 回归 test: {{test}} + 新增 {{test}} | test-strategy-delta.md §2.{{test}} |
| 新增事件 {{event}} | 新增 integration test: {{test}} | test-strategy-delta.md §5.{{test}} |

## 与全量 design 工件的关系

- `domain-model.md` + `tech-plan.md` 保持全量快照不变
- `design-delta.md` 记录本次增量变更
- Phase 5 Analyze 时对比全量 + delta 的一致性
- 多次增量时，编号递增
