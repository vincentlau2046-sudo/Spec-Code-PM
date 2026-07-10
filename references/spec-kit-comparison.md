# spec-kit vs spec-code-pm 对比说明

## 概述

spec-code-pm 以 spec-kit 的 Phase 语义为基础框架，针对大规模项目的 DDD 实践进行了增强和扩展。

## Phase 映射关系

| spec-kit Phase | spec-code-pm Phase | 关系 |
|----------------|-------------------|------|
| constitution | Phase 0 | 保留原样 |
| specify | Phase 2 | 增强：增加术语一致性检查 |
| clarify | Phase 3 | 保留原样 |
| plan | Phase 4 (部分) | 合并到 Design，作为 tech-plan |
| analyze | Phase 5 | 增强：增加 DDD 一致性检查 |
| tasks | Phase 6 | 增强：增加 constitution 质量映射 |
| implement | Phase 7 | 增强：增加 --batch 模式和微 analyze |
| converge | Phase 8 | 保留原样 |

## spec-code-pm 独有增强

### Phase 1: Context (DDD 战略层)
- 产品愿景 (product.md)
- 统一语言 (ubiquitous-lang.md)
- 限界上下文 (bounded-context.md)

### Phase 4: Design (DDD 战术层)
- 领域建模 (domain-model.md)
- 技术计划 (tech-plan.md)

### Phase 9: Release (里程碑发布)
- 多 feature 聚合
- 发布风险评估
- 发布检查清单

## 架构差异

```
spec-kit:
  constitution → specify → clarify → plan → analyze → tasks → implement → converge

spec-code-pm:
  constitution → context(DDD) → specify → clarify → design(DDD+plan) → analyze → tasks → implement → converge → release
```

## 使用建议

- 简单项目：直接使用 spec-kit 即可
- 需要 DDD 建模的项目：使用 spec-code-pm
- 大规模多 feature 项目：必须使用 spec-code-pm 的 Phase 9 Release 能力