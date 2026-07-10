# 收敛评估 (Convergence)

## Feature: {{feature_name}}

> 实现 vs 规格对齐度报告——确认 feature 是否达到可发布状态。

## 总体评分

| 维度 | 评分 | 说明 |
|------|------|------|
| 用户故事覆盖率 | {{coverage_pct}}% | {{story_count}}/{{total_stories}} stories covered |
| 领域模型实现度 | {{model_coverage_pct}}% | {{model_covered}}/{{total_aggregates}} aggregates implemented |
| 验收标准通过率 | {{acceptance_pass_pct}}% | {{passed_criteria}}/{{total_criteria}} criteria passed |
| 遗漏项 | {{gap_count}} 个 | 详见下方遗漏清单 |
| 偏差项 (Scope Creep) | {{scope_creep_count}} 个 | 详见下方偏差清单 |

## 用户故事覆盖率

| Story ID | 标题 | 覆盖率 | 状态 |
|----------|------|--------|------|
| {{story_id}} | {{story_title}} | {{story_coverage}}% | ✅ 完成 / ⚠️ 部分 / ❌ 未开始 |

## 领域模型实现度

| 聚合 | 实体实现 | VO 实现 | 服务实现 | 状态 |
|------|----------|---------|----------|------|
| {{aggregate}} | {{entities}}/{{total_entities}} | {{vos}}/{{total_vos}} | {{services}}/{{total_services}} | ✅/⚠️/❌ |

## 验收标准逐项对照

| Story | 验收标准 | Given | When | Then | 状态 |
|-------|----------|-------|------|------|------|
| {{story_id}} | AC-{{ac_id}} | {{given}} | {{when}} | {{then}} | ✅/❌ |

## 遗漏清单 (Gaps)

| ID | 来源 | 描述 | 严重度 | 建议 |
|----|------|------|--------|------|
| GAP-{{gap_id}} | spec.md §{{section}} | {{gap_desc}} | P0/P1/P2 | {{recommendation}} |

## 偏差清单 (Scope Creep)

| ID | 描述 | 来源 | 影响评估 | 建议 |
|----|------|------|----------|------|
| SC-{{creep_id}} | {{creep_desc}} | implementation | {{impact}} | {{recommendation}} |

## 测试质量 (T.8)

| 指标 | 目标 | 实际 | 判定 |
|------|------|------|------|
| AC ↔ 测试覆盖率 | 100% AC 有对应测试用例 | {{ac_test_coverage}}% | ✅/⚠️/❌ |
| 聚合不变约束断言覆盖率 | 100% 聚合有 unit test | {{aggregate_test_coverage}}% | ✅/⚠️/❌ |
| 边界条件 → test case 映射 | 100% 边界条件有 edge case test | {{boundary_test_coverage}}% | ✅/⚠️/❌ |
| mutation_score | 可选（如配置了 mutation runner 则填写） | {{mutation_score}} | N/A |

## 结论

- **收敛判定**: PASS / BLOCKED
- **可进入 Release?**: yes (需人工确认) / no (需补做)
- **阻塞原因**: {{block_reason}}