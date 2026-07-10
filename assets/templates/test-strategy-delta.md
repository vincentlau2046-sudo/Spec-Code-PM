# 增量测试策略 (Test Strategy Delta)

## Feature: {{feature_name}}
## Delta ID: DELTA-{{delta_id}}
## 基于: {{base_test_strategy_path}} (如 specs/{{feature_name}}/test-strategy.md)
## 创建日期: {{delta_date}}

> 本文件记录对测试策略的增量变更。Phase 4 Design 在增量模式下产出的差异测试策略。
> delta 与 spec-delta-{{delta_id}}.md / design-delta-{{delta_id}}.md 的 delta_id 保持一致。

## 变更测试类型摘要

| 类型 | 数量 | 说明 |
|------|------|------|
| 新增测试用例 | {{new_tests}} | 本次增量新增的测试 |
| 修改测试用例 | {{modified_tests}} | 已有测试被修改 |
| 回归测试需求 | {{regression_tests}} | 受影响的已有测试 |

## 新增测试用例

### 新增聚合 → Unit Test

| 聚合名 | 测试文件 | 不变约束覆盖 | test_case_id |
|--------|----------|-------------|-------------|
| {{new_aggregate}} | {{test_file}} | yes/no | TC-DELTA-{{delta_id}}-{{num}} |

### 新增实体 → Unit Test

| 实体名 | 测试文件 | 状态机覆盖 | test_case_id |
|--------|----------|-----------|-------------|
| {{new_entity}} | {{test_file}} | yes/no | TC-DELTA-{{delta_id}}-{{num}} |

### 新增事件 → Integration Test

| 事件名 | 测试文件 | 订阅者链路 | test_case_id |
|--------|----------|-----------|-------------|
| {{new_event}} | {{test_file}} | yes/no | TC-DELTA-{{delta_id}}-{{num}} |

## 修改测试用例（回归）

| 原测试 ID | 修改原因 | 修改内容 | 回归风险 |
|-----------|----------|----------|----------|
| {{old_test_id}} | 受 design-delta-{{delta_id}} 影响 | {{modification}} | high/medium/low |

## 废弃测试用例

| 原测试 ID | 废弃原因 | 替代测试 |
|-----------|----------|----------|
| {{deprecated_test_id}} | {{reason}} | {{replacement}} |

## 与全量测试策略的关系

- `test-strategy.md` 保持全量快照不变
- `test-strategy-delta-{{delta_id}}.md` 记录本次增量变更
- 多次增量时，delta 编号递增（DELTA-001, DELTA-002...）
- T.6 test-basis 字段在增量模式下指向 `test-strategy-delta-{{delta_id}}.md §<section>`