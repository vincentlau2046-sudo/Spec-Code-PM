# 阶段评审清单 (Review Checklist)

## Phase 0 — Constitution

- [ ] 质量门槛已明确定义（覆盖率、审查要求等）
- [ ] 技术约束已记录（语言版本、框架限制）
- [ ] 编码规范已制定
- [ ] 分支策略已确定
- [ ] 治理原则无内部矛盾

## Phase 1 — Context

- [ ] 产品愿景清晰，价值主张明确
- [ ] 统一语言已建立，无歧义术语
- [ ] 限界上下文边界已划定
- [ ] 上下文映射已识别关键关系
- [ ] 防腐层策略已确定
- [ ] 产品定位与 constitution 治理原则一致

## Phase 2 — Specify

- [ ] 用户故事使用统一语言中的术语
- [ ] 验收标准可测试（Given/When/Then 格式）
- [ ] 无模糊描述（"快速"、"友好"等需量化）
- [ ] 与 bounded context 边界一致
- [ ] 优先级已标注（P0/P1/P2）
- [ ] 非功能要求已明确

### Phase 2 (增量模式补充)
- [ ] spec-delta.md 已产出，delta_id 编号正确
- [ ] 增量 AC 编号规则（原编号.DELTA-{{id}}）已遵循
- [ ] 影响域已识别，回归测试需求已标注

## Phase 3 — Clarify

- [ ] 所有模糊点已识别并记录
- [ ] 边界条件已确认（异常路径、幂等性、并发）
- [ ] 待定决策（DCF）有明确决策人和状态
- [ ] 澄清结果已与用户确认

## Phase 4 — Design

- [ ] 聚合边界合理（不变约束可维护）
- [ ] 实体有明确标识，值对象不可变
- [ ] 领域事件覆盖关键状态变更
- [ ] 仓库接口与聚合边界对齐
- [ ] 无贫血模型（行为在领域层）
- [ ] tech-plan 的 ADR 有完整的背景和后果
- [ ] 技术选型有明确理由和备选方案
- [ ] test-strategy.md 已产出 (T.4)，覆盖所有聚合和领域事件

### Phase 4 (增量模式补充)
- [ ] design-delta.md 已产出，与 spec-delta.md 的 delta_id 一致
- [ ] 修改聚合的影响约束已评估
- [ ] test-strategy-delta.md 已联动更新

## Phase 5 — Analyze

- [ ] spec ↔ domain-model 交叉验证通过
- [ ] domain-model ↔ tech-plan 一致性确认
- [ ] 统一语言术语在 spec 和 model 中一致
- [ ] constitution 质量门槛被 tech-plan 满足
- [ ] 范围边界无遗漏或溢出
- [ ] 所有 P0 gap 已有解决方案

## Phase 6 — Tasks

- [ ] 每个任务 <= 8h 可完成（原子化）
- [ ] 依赖关系完整（无循环依赖）
- [ ] 优先级标注合理（P0 > P1 > P2）
- [ ] 每个任务有明确验收标准
- [ ] 执行顺序建议与依赖图一致
- [ ] 每个任务标注了对应的领域模型元素
- [ ] constitution 质量要求已映射到相关任务
- [ ] 每个任务绑定 test-basis (T.6): test-strategy.md §section

### Phase 6 (增量模式补充)
- [ ] 增量任务编号续接正确
- [ ] 任务对已有代码的依赖已标注

## Phase 7 — Implement

- [ ] 实现与 domain-model 一致
- [ ] 所有验收标准通过
- [ ] 无技术债遗留（或已记录为后续任务）
- [ ] 测试覆盖核心领域逻辑
- [ ] 代码审查通过
- [ ] 微 analyze 无 P0 偏离（如 auto_analyze 开启）
- [ ] TDD 循环遵循 (T.7): RED→GREEN→REFACTOR
- [ ] TDD 遵循报告包含 RED 验证

## Phase 8 — Converge

- [ ] 用户故事覆盖率 >= 90%
- [ ] 验收标准通过率 >= 90%
- [ ] 领域模型实现度已评估
- [ ] scope creep 清单已审查（< 10% 可接受）
- [ ] 遗漏项清单已评估（P0 项必须补全）
- [ ] converge 报告已归档
- [ ] 测试质量评估 (T.8): AC↔测试覆盖率、聚合不变约束断言覆盖、边界→test case 映射
- [ ] mutation_score 已记录（如配置了 mutation runner，否则 N/A）

## Phase 9 — Release

- [ ] 里程碑内所有 feature 的 converge 状态已汇总
- [ ] 跨 feature 依赖关系已确认无冲突
- [ ] 发布风险评估已完成
- [ ] release summary 已归档到 releases/<milestone>/
- [ ] 回归测试 + 集成测试确认 (T.9)
## Phase 7 — Implement (增量模式补充)
- [ ] TDD Iron Law 在增量修改中适用：已有测试基线已验证 (BASELINE)
- [ ] 增量修改的回归测试已执行 (REGRESSION)
- [ ] TDD 遵循报告区分新增测试与修改测试

## Phase 8 — Converge (增量模式补充)
- [ ] 增量 AC 通过率与原有 AC 回归退化分别报告
- [ ] 原有 AC 通过率 >= 全量 converge 时的通过率
- [ ] 增量收敛报告明确变更范围与影响域
