# 技术实现计划 (Tech Plan)

## Feature: {{feature_name}}

> 在领域建模完成后，确定技术方案与架构决策，确保技术方案服务领域模型而非反之。

## 技术栈选择

| 组件 | 选型 | 理由 | 备选 |
|------|------|------|------|
| {{tech_stack}} | | | |

## 架构决策记录 (ADR)

### ADR-{{adr_id}}: {{decision}}

- **状态**: {{adr_status}} (accepted / superseded / deprecated)
- **背景**: {{adr_context}}
- **决策**: {{decision_detail}}
- **后果**:
  - {{consequences}}

<!-- 重复每个 ADR -->

## 关键接口设计

### 接口定义

```
Interface: {{interface_name}}
Method: {{method_signature}}
Contract: {{preconditions}} / {{postconditions}}
```

### 数据流

```
{{data_flow_ascii_diagram}}
```

## 与领域模型的关系

| 领域模型元素 | 技术实现映射 | 实现方式 |
|-------------|-------------|----------|
| {{domain_element}} | {{tech_mapping}} | {{implementation}} |

## 依赖与部署

| 依赖 | 类型 | 版本约束 |
|------|------|----------|
| {{dependency}} | internal/external | {{version}} |