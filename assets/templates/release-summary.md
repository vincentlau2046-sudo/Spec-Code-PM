# 里程碑发布汇总 (Release Summary)

## Milestone: {{milestone}}

> 多 feature 聚合发布评估，基于各 feature 的收敛状态做发布决策。

## 发布概况

| 字段 | 值 |
|------|-----|
| 里程碑 | {{milestone}} |
| 目标日期 | {{target_date}} |
| Feature 总数 | {{feature_count}} |
| 已收敛 Feature | {{converged_count}}/{{feature_count}} |
| 风险等级 | {{risk_level}} (Low/Medium/High/Critical) |

## 包含的 Feature

| Feature | Phase 8 状态 | 覆盖率 | 遗漏项 | 偏差项 | 可发布? |
|---------|-------------|--------|--------|--------|---------|
| {{feature_name}} | ✅/⚠️/❌ | {{coverage}}% | {{gaps}} | {{creeps}} | yes/no |

## 跨 Feature 依赖

| 上游 Feature | 下游 Feature | 依赖关系 | 状态 |
|-------------|-------------|----------|------|
| {{upstream}} | {{downstream}} | {{dependency_type}} | resolved/unresolved |

## 发布风险评估

| 风险 | 来源 Feature | 严重度 | 缓解措施 |
|------|-------------|--------|----------|
| {{risk_desc}} | {{source_feature}} | P0/P1/P2 | {{mitigation}} |

## 发布检查清单

- [ ] 所有 P0 feature 收敛状态为 PASS
- [ ] 跨 feature 依赖已解决
- [ ] P0 级遗漏项已处理或有明确延期计划
- [ ] 偏差项已通过架构评审
- [ ] 宪法质量门槛全部满足
- [ ] 集成测试通过
- [ ] 回归测试通过
- [ ] 发布说明已撰写

## 发布决策

- **判定**: GO / NO-GO
- **决策人**: {{decision_maker}}
- **日期**: {{decision_date}}
- **备注**: {{notes}}