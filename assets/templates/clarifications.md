# 需求澄清 (Clarifications)

## Feature: {{feature_name}}

> 在 spec 完成、design 开始前，自动识别并确认所有模糊点与边界条件。

## 模糊点识别

| ID | 原文 | 模糊之处 | 澄清结果 | 决策 |
|----|------|----------|----------|------|
| {{ambiguity_id}} | {{original_text}} | {{ambiguity}} | {{clarified}} | {{decision}} |

## 边界条件确认

### 异常路径
| 场景 | 期望行为 | 是否覆盖 | test_case_id |
|------|----------|----------|-------------|
| {{edge_case}} | {{expected}} | yes/no | {{test_case_id}} |

### 并发场景
| 场景 | 策略 | 是否覆盖 |
|------|------|----------|
| {{concurrency_case}} | {{strategy}} | yes/no |

### 幂等性要求
| 操作 | 是否幂等 | 实现方式 |
|------|----------|----------|
| {{operation}} | yes/no | {{idempotency_mechanism}} |

## 待定决策 (DCF — Decision, Clarification, Finding)

| ID | 类型 | 内容 | 决策人 | 状态 |
|----|------|------|--------|------|
| {{dcf_id}} | Decision/Clarification/Finding | {{dcf_content}} | {{owner}} | open/resolved |

## 与 Spec 的关系

本文件是对 `spec.md` 的补充与精确化。clarify 阶段产出的内容自动合并到后续 design 阶段的上下文中。