# 领域模型 (Domain Model)

## Feature: {{feature_name}}

## 聚合 (Aggregates)

### {{aggregate_name}}

```
+---------------- Aggregate Root ----------------+
|  [Entity] {{entity_name}}                        |
|  +--[Entity] {{child_entity}}                    |
|  +--[Value Object] {{vo_name}}                    |
+------------------------------------------------+
```

- **聚合根**: {{root_entity_name}}
- **不变约束**: {{invariant_rules}}
- **边界说明**: {{boundary_note}}

<!-- 重复每个聚合 -->

## 实体 (Entities)

| 实体名 | ID 策略 | 生命周期 | 所属聚合 |
|--------|---------|----------|----------|
| {{entity_name}} | {{id_strategy}} | {{lifecycle}} | {{aggregate}} |

## 值对象 (Value Objects)

| 值对象 | 构成属性 | 不变性 | 用途 |
|--------|----------|--------|------|
| {{vo_name}} | {{vo_attrs}} | {{immutability}} | {{vo_purpose}} |

## 领域服务 (Domain Services)

| 服务名 | 职责 | 无状态 | 涉及聚合 |
|--------|------|--------|----------|
| {{service_name}} | {{service_desc}} | yes/no | {{involved_aggregates}} |

## 领域事件 (Domain Events)

| 事件名 | 触发条件 | 携带信息 | 订阅者 |
|--------|----------|----------|--------|
| {{event_name}} | {{event_trigger}} | {{event_payload}} | {{event_subscribers}} |

## 仓库 (Repositories)

| 仓库 | 聚合根 | 查询接口 |
|------|--------|----------|
| {{repo_name}} | {{repo_root}} | {{repo_queries}} |