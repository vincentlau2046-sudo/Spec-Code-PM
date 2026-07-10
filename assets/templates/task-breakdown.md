# 任务分解 (Task Breakdown)

## Feature: {{feature_name}}

## 任务清单

| # | 任务名 | 类型 | 优先级 | 依赖 | 估算 | 状态 |
|---|--------|------|--------|------|------|------|
| 1 |        | infra/model/api/integration/test | P0/P1/P2 | 无/#N | 1h/2h/4h/8h | ⬜ |

### 任务详情

#### Task {{task_id}}: {{task_name}}
- **类型**: {{task_type}} (infra / model / api / integration / test)
- **描述**: {{task_description}}
- **test-basis**: test-strategy.md §{{test_basis}}（如不存在 test-strategy.md，降级为「按 AC 自行推断测试点」）
- **验收标准**:
  - [ ] {{acceptance_1}}
  - [ ] {{acceptance_2}}
- **上下文**: 见 `{{spec_path}}` 用户故事 #{{story_id}} + `{{model_path}}` 聚合 {{aggregate_name}}

<!-- 重复每个任务 -->

## 依赖关系图

```
Task 1 → Task 3 → Task 5
Task 2 → Task 3
Task 4 (独立)
```

## 执行建议

1. 先执行基础设施任务（infra），再执行领域模型（model），最后 API + 测试
2. 无依赖或依赖已完成的任务可并行委派