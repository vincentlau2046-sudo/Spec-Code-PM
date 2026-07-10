# 一致性分析报告 (Analysis)

## Feature: {{feature_name}}

> Phase 4 (Design) 后的质量门禁——跨工件交叉验证，确认设计完整性后再进入任务分解。

## 交叉验证矩阵

| 工件对 | 检查项 | 状态 | 详情 |
|--------|--------|------|------|
| spec ↔ domain-model | 用户故事被领域模型覆盖 | ✅/⚠️/❌ | |
| domain-model ↔ tech-plan | 聚合有对应技术方案 | ✅/⚠️/❌ | |
| spec ↔ ubiquitous-lang | 术语一致性 | ✅/⚠️/❌ | |
| tech-plan ↔ constitution | 质量门槛满足 | ✅/⚠️/❌ | |
| spec scope ↔ coverage | 范围无遗漏 | ✅/⚠️/❌ | |

## 差距清单 (Gaps)

| ID | 工件对 | 描述 | 严重度 | 解决方案 |
|----|--------|------|--------|----------|
| {{gap_id}} | {{artifact_pair}} | {{gap_description}} | P0/P1/P2 | {{resolution}} |

## 详细检查

### 1. 用户故事覆盖度

| 用户故事 | 覆盖的聚合/实体 | 状态 |
|----------|-----------------|------|
| Story 1: {{story_name}} | {{covering_elements}} | covered/partial/missing |

### 2. 术语一致性

| 术语 | spec 用法 | domain-model 用法 | 一致? |
|------|-----------|-------------------|-------|
| {{term}} | {{spec_usage}} | {{model_usage}} | yes/no |

### 3. 质量门禁合规

| Constitution 要求 | Tech Plan 实现 | 满足? |
|--------------------|----------------|-------|
| {{const_req}} | {{tech_implementation}} | yes/no |

## 门禁结论

- **结果**: PASS / FAIL (需修正后重审)
- **P0 gap 数**: {{p0_count}}
- **P1 gap 数**: {{p1_count}}
- **阻塞 Phase 6?**: yes/no