# 限界上下文 (Bounded Context)

## 上下文名称
{{context_name}}

## 上下文边界
<!-- 这个上下文负责什么？不负责什么？ -->

### 包含
{{in_scope}}

### 不包含
{{out_of_scope}}

## 上下文映射 (Context Map)

```
[上游上下文] → [本上下文] → [下游上下文]
```

| 关系类型 | 涉及上下文 | 说明 |
|----------|-----------|------|
| {{relationship_type}} | {{contexts}} | {{description}} |

## 上下文关系类型

| 类型 | 定义 | 何时使用 |
|------|------|----------|
| Partnership | 紧密协作，共享语言 | 同一团队维护 |
| Conformist | 下游完全采纳上游模型 | 强依赖场景 |
| Customer-Supplier | 上下游协商契约 | 跨团队 |
| Shared Kernel | 共享部分核心模型 | 部分重叠领域 |
| Anti-Corruption Layer | 隔离外部模型 | 外部系统集成 |
| Separate Ways | 完全独立 | 无交互 |

## 防腐层 (ACL)
<!-- 需要隔离的外部系统及其隔离策略 -->

| 外部系统 | ACL 策略 | 适配点 |
|----------|----------|--------|
| {{external_system}} | {{acl_strategy}} | {{adapter_point}} |