# claude-code-spec-workflow 借鉴点

## 原工具
[github.com/Pimzino/claude-code-spec-workflow](https://github.com/Pimzino/claude-code-spec-workflow)

## 借鉴的设计

### 1. 目录结构约定
- `.claude/` → 我们改为项目根目录直接建 `steering/` + `specs/`
- 不依赖 Claude Code 专属机制，更通用

### 2. 四阶段工作流
- Requirements → Design → Tasks → Implementation
- 我们扩展为 5 阶段（增加 Phase 0: Context），并注入 DDD 战略层

### 3. Steering Docs 概念
- product.md / tech.md / structure.md → 我们改为 DDD 版：product / ubiquitous-lang / bounded-context
- 核心思想不变：持久化项目上下文，指导后续所有阶段

### 4. 状态追踪
- 原工具使用 JSON 状态文件 + Dashboard
- 我们使用 Markdown STATUS.md，更轻量、可版本控制、可读

### 5. 任务委派
- 原工具使用 Claude Code 内置 agent
- 我们使用 OpenClaw `sessions_spawn` + Coding Agent，更灵活

## 不借鉴的部分

| 原工具特性 | 舍弃原因 |
|-----------|----------|
| Dashboard (Node.js 前端) | 过度工程，用 Markdown 状态表足够 |
| WebSocket 实时更新 | 对单人/小团队过重 |
| Slash Commands 机制 | Claude Code 专属，不通用 |
| Tunnel 功能 | 不在本技能范围内 |