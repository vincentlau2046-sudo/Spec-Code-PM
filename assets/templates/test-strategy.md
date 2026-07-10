# 测试策略 (Test Strategy)

## Feature: {{feature_name}}

> T.4 阶段产出：将领域模型中的不变约束、状态机、领域事件映射为可执行的测试计划。
> 本文件是 Phase 7 (Implement) 阶段 TDD 循环的合约源。

## 1. 聚合不变约束 → Unit Test

| 聚合 | 不变约束 | 测试类 | 测试方法 | 断言策略 |
|------|----------|--------|----------|----------|
| {{aggregate_name}} | {{invariant}} | {{test_class}} | {{test_method}} | {{assertion}} |

### 不变约束覆盖矩阵

| 聚合 | 约束数 | 已映射测试 | 覆盖率 | 状态 |
|------|--------|-----------|--------|------|
| {{aggregate}} | {{constraint_count}} | {{mapped_tests}} | {{coverage}}% | ✅/⚠️/❌ |

## 2. 实体状态机 → State Transition Tests

| 实体 | 状态集 | 合法转换 | 测试覆盖 |
|------|--------|----------|----------|
| {{entity}} | {{states}} | {{transitions}} | {{test_status}} |

## 3. 值对象不可变性 → Immutability Tests

| 值对象 | 不可变属性 | 测试方法 | 断言 |
|--------|-----------|----------|------|
| {{vo}} | {{immutable_props}} | {{test_method}} | 构造后修改应抛错 |

## 4. 领域服务 → Mock-based Unit Tests

| 服务 | 职责 | Mock 依赖 | 测试断言 |
|------|------|----------|----------|
| {{service}} | {{responsibility}} | {{mock_deps}} | {{assertion}} |

## 5. 领域事件 → Integration Tests

| 事件 | 发布者 | 订阅者 | 测试链路 | 断言要点 |
|------|--------|--------|----------|----------|
| {{event}} | {{publisher}} | {{subscribers}} | {{test_chain}} | {{assertion}} |

## 6. 仓库 → Repository Contract Tests

| 仓库 | 聚合根 | 查询接口 | 测试策略 |
|------|--------|----------|----------|
| {{repo}} | {{root}} | {{queries}} | 真实 DB vs in-memory 对比 |

## 7. 防腐层 (ACL) → Contract Tests

| 外部系统 | ACL 适配点 | 测试断言 | 隔离策略 |
|----------|-----------|----------|----------|
| {{external}} | {{adapter}} | 外部概念不泄漏到领域层 | Mock adapter |

## 8. 跨上下文 → Consumer-Driven Contract Tests

| 上游上下文 | 下游上下文 | 契约 | 测试策略 |
|------------|------------|------|----------|
| {{upstream}} | {{downstream}} | {{contract}} | Contract test suite |

## 测试执行优先级

> 定义 TDD 循环的执行顺序（RED → GREEN 的优先级）

| 优先级 | 测试组 | 理由 |
|--------|--------|------|
| P0 | 聚合不变约束 | 领域核心逻辑，失败代价最高 |
| P1 | 实体状态机 | 用户可见行为 |
| P2 | 值对象 | 辅助验证，可后期补 |
| P3 | 领域事件/集成 | 链路级验证 |