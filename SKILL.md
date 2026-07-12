# spec-code-pm — DDD 项目管理技能

> **触发词**: `spec-pm`（对话中使用的简短触发词，技能目录名为 `spec-code-pm`）
> **定位**: 大规模项目的端到端项目管理，融合 Spec Workflow 与 DDD 方法论
> **关系**: 基于 spec-kit 的 Phase 语义，增强 DDD 战略/战术层能力

## 10 Phase 工作流

| Phase | 名称 | 命令 | 来源 | 产出物 | 级别 |
|-------|------|------|------|--------|------|
| **Phase 0** | Constitution | `spec-pm constitution` | spec-kit | `steering/constitution.md` | Project (一次性) |
| **Phase 1** | Context | `spec-pm init` | DDD 独有 | `steering/{product,ubiquitous-lang,bounded-context}.md` | Project (一次性) |
| **Phase 2** | Specify | `spec-pm spec <name>` | spec-kit + DDD | `specs/<name>/spec.md` | Feature (可重复) |
| **Phase 3** | Clarify | `spec-pm clarify <name>` | spec-kit | `specs/<name>/clarifications.md` | Feature (可选) |
| **Phase 4** | Design | `spec-pm design <name>` | DDD + spec-kit plan | `specs/<name>/domain-model.md` + `tech-plan.md` | Feature (可重复) |
| **Phase 5** | Analyze | `spec-pm analyze <name>` | spec-kit + DDD | `specs/<name>/analysis.md` | Feature (质量门禁) |
| **Phase 6** | Tasks | `spec-pm tasks <name>` | spec-kit + DDD | `specs/<name>/task-breakdown.md` | Feature (可重复) |
| **Phase 7** | Implement | `spec-pm implement <name> [task]` | spec-kit | `specs/<name>/execution/report-task-<id>.md` | Feature (可重复) |
| **Phase 8** | Converge | `spec-pm converge <name>` | spec-kit | `specs/<name>/convergence.md` | Feature (阶段性) |
| **Phase 9** | Release | `spec-pm release <milestone>` | 新增 | `releases/<milestone>/release-summary.md` | Milestone |

### Phase 序列逻辑

> 每个 Phase 采用 D.x (Design/Development) / T.x (Test/Verify) 双轨制，在 Phase 内部细化为设计与验证子步骤。Phase 命令接口不变。

### Phase 7→8 端到端冒烟检查（强制 Gate）

> **教训来源**: InferFabric v4.1 三个 bug 全部源于模块间接口不匹配，pytest 单元覆盖 100% 仍无法捕获。

Phase 7 实施完成后、Phase 8 收敛前，**必须**执行以下冒烟检查清单。

#### 冒烟检查清单模板

```markdown
# Smoke Test Checklist — {Feature Name}

## 1. 模块集成验证
- [ ] 所有新/修改的模块导入成功（无 ImportError）
- [ ] 模块间接口签名一致（参数类型、返回值格式）
- [ ] 跨模块调用链路完整（A→B→C 无断裂）

## 2. 运行时验证
- [ ] 服务启动无错误日志
- [ ] 核心 API 端点返回 200（非 500/502）
- [ ] Dashboard/CLI 关键功能可交互

## 3. 数据流验证
- [ ] 关键指标数据完整（非 undefined/null）
- [ ] 配置变更实时生效
- [ ] 错误处理链路正常（异常不吞没）

## 4. 回归检查
- [ ] 已有功能未受破坏（手动冒烟关键路径）
- [ ] 配置向后兼容
- [ ] 日志/监控无异常告警

**Gate 规则**: 任何一项 ❌ → 阻塞进入 Phase 8，必须修复后重新冒烟。
```

#### 执行方式

| 场景 | 方法 | 负责方 |
|------|------|--------|
| API/服务集成 | `curl` + `python3 -c` 验证 JSON 结构 | Assistant |
| 前端 Dashboard | 浏览器控制台 `console.log()` 检查数据流 | Assistant |
| CLI 命令 | 直接执行 + 输出验证 | Coding Agent |
| 配置变更 | 对比 diff + 热重载验证 | Assistant |

#### 失败处理

- 冒烟失败 → 在 `specs/<name>/convergence.md` 记录失败项
- 修复后重新冒烟 → 标记 `Retest: {date}`
- 连续 2 次冒烟失败 → 升级至 PM 审查，可能回退

```
Phase 0 Constitution ──┐
                         ├── 全局层（制定一次，约束一切）
Phase 1 Context ─────────┘
      │
      ▼  "先明确我们在什么领域工作"
Phase 2 Specify ──── 问题空间（用户要什么）
      │
      ▼  "需求清楚后，先消除模糊点"
Phase 3 Clarify ──── 问题空间（边界条件确认）
      │
      ▼  "消除模糊后，建立领域模型"
Phase 4 Design ───── 解空间（DDD 战术建模 + 技术方案 + T.4 测试策略映射）
      │
      ▼  "设计完成后，检查一致性"
Phase 5 Analyze ──── 质量门禁（spec↔design↔plan 交叉验证 + T.5 测试完备性）
      │
      ▼  "一致后，拆解为可执行任务"
Phase 6 Tasks ────── 解空间（原子任务 + 依赖图 + T.6 test-basis 绑定）
      │
      ▼  "任务拆解后，委派执行"
Phase 7 Implement ── 执行层（TDD 驱动 + Coding Agent 委派 + 实时验证）
      │
      ▼  "执行完成后，评估对齐度"
Phase 8 Converge ─── 评估层（实现 vs 规格对齐 + T.8 测试质量）
      │
      ▼  "收敛通过后，聚合为里程碑"
Phase 9 Release ──── 聚合层（多 feature 里程碑发布）
```

### 阶段级别分类

| 级别 | Phase | 说明 |
|------|-------|------|
| **Project** | 0 (Constitution), 1 (Context) | 项目初始化时执行一次，后续 feature 共享 |
| **Feature** | 2→8 | 每个 feature 独立走完整流程，feature 间可并行 |
| **Milestone** | 9 (Release) | 汇聚多个 feature 的 converge 结果，做发布决策 |

## 使用方式

### 项目初始化（一次性）

```bash
# Phase 0: 制定治理原则
spec-pm constitution

# Phase 1: DDD 战略层 — 产品愿景 + 统一语言 + 限界上下文
spec-pm init
```

### Feature 流程（可重复，可并行）

```bash
# Phase 2: 业务需求
spec-pm spec user-auth

# Phase 3: 需求澄清（可选）
spec-pm clarify user-auth

# Phase 4: DDD 设计 + 技术计划
spec-pm design user-auth

# Phase 5: 质量门禁
spec-pm analyze user-auth

# Phase 6: 任务分解
spec-pm tasks user-auth

# Phase 7: 执行与验证
spec-pm implement user-auth              # 全部任务
spec-pm implement user-auth 3             # 仅任务 #3
spec-pm implement user-auth 1 2          # 并行任务 #1 和 #2
spec-pm implement user-auth --batch      # 按波次自动调度

# Phase 8: 收敛评估
spec-pm converge user-auth
```

### 里程碑发布

```bash
# Phase 9: 多 feature 聚合发布
spec-pm release sprint-1
```

### 增量开发模式

```bash
# 启用增量模式（在 .specpmrc 中设置 incremental=true）
# 增量模式下：
#   Phase 2 → spec-delta-001.md
#   Phase 4 → design-delta-001.md + test-strategy-delta-001.md
#   Phase 6 → task-breakdown-delta-001.md (或追加到 task-breakdown.md)
#   Phase 8 → 增量收敛（对比变更前后状态）

# 多次增量时 delta 编号递增：001, 002, 003...
```

### 通用命令

```bash
spec-pm status                          # 全局状态
spec-pm status user-auth                # 单 feature 状态
spec-pm tasks-to-issues user-auth       # 任务转 GitHub Issues
```

## 状态管理

### 双层状态系统

**全局总览** (`specs/STATUS.md`):

```
| Feature | P0 | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 | 进度 |
|---------|----|----|----|----|----|----|----|----|----|------|
| user-auth | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | 100% |
| payment   | ✅ | ✅ | ✅ | ⬜ | ... | ... | ... | ... | ... | 30% |
```

**单 Feature 详情** (`specs/<name>/STATUS.md`):
- 详细记录每个 phase 的状态、完成时间、备注
- 记录阻塞项和依赖关系

状态符号: `✅` 完成 | `🔄` 进行中 | `⬜` 未开始 | `⚠️` 阻塞 | `❌` 失败

### `.specpmrc` 配置

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

## 输出目录结构

```
steering/                          # 项目级全局文档
├── constitution.md                # Phase 0: 治理原则
├── product.md                       # Phase 1: 产品愿景
├── ubiquitous-lang.md             # Phase 1: 统一语言
└── bounded-context.md              # Phase 1: 限界上下文

specs/
├── STATUS.md                        # 全局总览
└── <feature>/
    ├── STATUS.md                      # 单 feature 状态
    ├── spec.md                        # Phase 2: 功能规格
    ├── clarifications.md              # Phase 3: 需求澄清
    ├── domain-model.md                # Phase 4: 领域模型
    ├── tech-plan.md                  # Phase 4: 技术计划
    ├── analysis.md                   # Phase 5: 一致性分析
    ├── task-breakdown.md              # Phase 6: 任务分解
    ├── execution/                    # Phase 7: 执行报告
    │   └── report-task-*.md
    ├── convergence.md                # Phase 8: 收敛评估
    └── checklists/                   # 各阶段评审清单
        └── *.md

releases/                            # Phase 9: 里程碑
└── <milestone>/
    └── release-summary.md
```

## 约束

1. **阶段顺序强制**: 必须按 Phase 0→1→...→9 顺序，跳过阶段需明确跳过理由
2. **跨阶段上下文**: 每个阶段 prompt 自动读取前序阶段产出
3. **产出格式**: 全部 Markdown，可被 Coding Agent 直接消费
4. **模板优先**: Phase 2-9 由 Agent 从 `assets/templates/` 复制模板到 `specs/<name>/` 并填充 `{{ }}` 占位符
5. **输出目录可配置**: 通过 `.specpmrc` 的 `output_dir` 指定产出物位置（默认 `.` = 项目根目录），所有路径（`steering/`、`specs/`、`releases/`）基于此目录解析
6. **DDD 术语**: 使用标准 DDD 术语（Eric Evans / Domain-Driven Design Distilled）
7. **占位符风格**: 统一使用 `{{ }}` 风格
8. **向后兼容**: 旧命令 `spec-pm execute <name>` 仍可用，内部映射为 `spec-pm implement <name>`

## 与 Coding Agent 集成

Phase 7 将 `task-breakdown.md` 中的任务委派给 Coding Agent（Claude Code / AtomCode）：
- 每个任务携带完整上下文：`spec.md` + `domain-model.md` 内容作为附加上下文注入 Coding Agent prompt
- 验收标准来自 Phase 2 的 acceptance criteria（Given/When/Then）
- 执行报告写回 `execution/` 目录
- 使用 OpenClaw `sessions_spawn` 委派，`context="isolated"` 除非需要对话上下文

## 与 spec-kit 的关系

| spec-kit Phase | spec-code-pm Phase | 说明 |
|----------------|-------------------|------|
| constitution | Phase 0 | 直接映射，治理原则 |
| (无) | Phase 1 | DDD 独有：战略层上下文建立 |
| specify | Phase 2 | 增强术语一致性检查 |
| clarify | Phase 3 | 直接映射，需求澄清 |
| plan | Phase 4 | 与 DDD domain-model 融合 |
| analyze | Phase 5 | 直接映射，增加 DDD 一致性检查 |
| tasks | Phase 6 | 直接映射，增加 constitution 质量要求映射 |
| implement | Phase 7 | 直接映射，增加 --batch 模式和微 analyze |
| converge | Phase 8 | 直接映射，收敛评估 |
| (无) | Phase 9 | 新增：多 feature 里程碑聚合 |