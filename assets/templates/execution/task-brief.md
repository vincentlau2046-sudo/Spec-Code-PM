# Task Brief: {{task_name}}

## 元数据

| 字段 | 值 |
|------|-----|
| Feature | `{{feature_name}}` |
| Task ID | `{{task_id}}` |
| 类型 | `{{task_type}}` (infra / model / api / integration / test) |
| 依赖 | `{{dependencies}}` |
| 模式 | `{{mode}}` (full / incremental) |
| 估算 | `{{estimate}}` |

## 任务描述

{{task_description}}

## 验收标准

| 编号 | 标准 | Given | When | Then | 类型 |
|------|------|-------|------|------|------|
| {{ac_id_1}} | {{ac_desc_1}} | {{ac_given_1}} | {{ac_when_1}} | {{ac_then_1}} | base/delta |
| {{ac_id_2}} | {{ac_desc_2}} | {{ac_given_2}} | {{ac_when_2}} | {{ac_then_2}} | base/delta |

## 关联用户故事

### Story {{story_id}}: {{story_title}}

{{story_description}}

**关联 AC**:
- {{ac_ref_1}}
- {{ac_ref_2}}

## 关联领域模型

### {{aggregate_name}} (aggregate)

- **职责**: {{aggregate_responsibility}}
- **实体**: {{entities}}
- **值对象**: {{value_objects}}

### 不变约束

```
{{invariants}}
```

## 统一语言（相关条目）

| 术语 | 定义 |
|------|------|
| {{term_1}} | {{definition_1}} |
| {{term_2}} | {{definition_2}} |

## TDD 契约

- **TDD 强制**: {{tdd_required}} (model/api/integration 任务必须遵循)
- **RED 阶段**: 先产出失败测试用例，验证预期失败 → 再实现代码 → 跑通测试
- **违规后果**: 先写实现后补测试视为「TDD 未遵循」，在审查中标记

## 约束

- 仅实现本任务定义的验收标准，不越界修改其他模块
- 技术选型遵循 `spec.md` 和 `tech-plan.md` 的约定
- 代码风格遵循 `steering/constitution.md` 的命名规范