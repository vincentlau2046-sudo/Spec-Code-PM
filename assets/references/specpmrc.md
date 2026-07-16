# `.specpmrc` 配置参考

> Spec-Code-PM 项目配置文件，由 `init-project.sh` 自动生成于项目根目录。

## 文件位置

```
<project-root>/.specpmrc
```

## 配置项

### `output_dir`

| 属性 | 值 |
|------|-----|
| 类型 | 路径（相对于项目根目录） |
| 默认 | `.`（即项目根目录本身） |
| 作用 | 所有产出物目录的基准路径 |

产出物目录结构基于此值解析：

```
{output_dir}/steering/    # 全局文档（constitution, product, …）
{output_dir}/specs/       # 功能规格（spec, design, tasks, …）
{output_dir}/releases/    # 发布记录
```

**场景**：项目代码在 `src/`，但规格文档希望统一放在 `docs/spec-pm/`，则设置 `output_dir=docs/spec-pm`。

---

### `phase_mode`

| 属性 | 值 |
|------|-----|
| 类型 | 枚举 |
| 可选值 | `sequential` / `flexible` |
| 默认 | `sequential` |
| 作用 | 控制阶段执行顺序策略 |

- **`sequential`**：严格按 Phase 0→1→2→…→9 顺序执行，每个 Phase 完成后才进入下一阶段。适合首次开发、团队协作需要明确阶段门控的场景。
- **`flexible`**：允许跳转到任意 Phase，适合迭代修改、局部重设计、已有项目补全特定阶段的场景。

---

### `auto_analyze`

| 属性 | 值 |
|------|-----|
| 类型 | 布尔 |
| 默认 | `true` |
| 作用 | Phase 7 (implement) 完成后是否自动触发微 analyze |

- **`true`**：implement 完成后自动回溯分析实施偏差，更新 `analysis.md`。
- **`false`**：跳过自动回溯，需手动执行 `spec-pm analyze`。

---

### `incremental`

| 属性 | 值 |
|------|-----|
| 类型 | 布尔 |
| 默认 | `false` |
| 作用 | 增量开发模式开关 |
| 影响范围 | Phase 2 / 4 / 6 / 8 |

- **`false`（全量模式）**：每次执行产出完整工件（`spec.md`, `design.md`, `task-breakdown.md`），覆盖已有内容。
- **`true`（增量模式）**：Phase 2/4/6 产出 **delta 文件**而非重写全量工件，Phase 8 追加增量覆盖率评估。

#### 增量模式产出物

| Phase | 全量产出 | 增量产出 |
|-------|---------|---------|
| 2 (Specify) | `spec.md` | `spec-delta-{id}.md` |
| 4 (Design) | `design.md` | `design-delta-{id}.md` |
| 6 (Tasks) | `task-breakdown.md` | 任务编号续接，不产出独立 delta 文件 |
| 8 (Converge) | `convergence.md` | 追加「原有 AC vs 增量 AC」覆盖率区分 |

delta 文件与全量文件**共存**于 `specs/<name>/` 同一目录，命名约定：`<original>-delta-{{delta_id}}.md`

#### 增量模式约束

- Phase 总数不变（仍 10 Phase）
- 命令接口不变
- delta ID 由 Phase 2 Step 1b 自动生成
- 每个 delta 模板是独立 `.md` 文件，prompt 通过条件分支决定写入哪个

---

## 完整示例

```ini
# spec-code-pm 配置

# 产出物输出目录（相对于项目根目录）
output_dir=.

# 阶段执行模式: sequential (严格顺序) / flexible (灵活跳转)
phase_mode=sequential

# implement 后是否自动触发微 analyze
auto_analyze=true

# 增量开发模式: true (增量) / false (全量)
# 增量模式下 Phase 2/4/6 产出 delta 文件而非重写全量工件
incremental=false
```

### 增量迭代场景示例

```ini
output_dir=.
phase_mode=flexible
auto_analyze=true
incremental=true
```

`flexible` + `incremental` 组合：跳转到需要修改的 Phase，仅产出变更部分，避免全量重写。

---

## 修改方式

1. **手动编辑**：直接修改项目根目录 `.specpmrc`
2. **重新初始化**：`init-project.sh` 会覆盖 `.specpmrc`（注意备份自定义配置）

> ⚠️ `init-project.sh` 不做增量合并，重新运行将覆盖已有 `.specpmrc`。
