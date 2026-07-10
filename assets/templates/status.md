# Feature 状态

## 双层状态系统

### 全局总览 (specs/STATUS.md)

多 feature 并行时，全局 STATUS 追踪所有 feature 进度：

```
| Feature | P0 | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 | 进度 |
|---------|----|----|----|----|----|----|----|----|----|------|
| {{feature_1}} | {{p0}} | {{p1}} | {{p2}} | {{p3}} | {{p4}} | {{p5}} | {{p6}} | {{p7}} | {{p8}} | {{progress_1}}% |
| {{feature_2}} | {{p0}} | {{p1}} | {{p2}} | {{p3}} | {{p4}} | {{p5}} | {{p6}} | {{p7}} | {{p8}} | {{progress_2}}% |
```

状态符号: `✅` 完成 | `🔄` 进行中 | `⬜` 未开始 | `⚠️` 阻塞 | `❌` 失败

### 单 Feature 详情 (specs/<name>/STATUS.md)

---

## Feature: {{feature_name}}

### 当前阶段: {{current_phase}}

### 阶段状态

| Phase | 名称 | 状态 | 完成时间 | 备注 |
|-------|------|------|----------|------|
| Phase 0 | Constitution | {{phase0_status}} | {{phase0_done_at}} | |
| Phase 1 | Context | {{phase1_status}} | {{phase1_done_at}} | |
| Phase 2 | Specify | {{phase2_status}} | {{phase2_done_at}} | |
| Phase 3 | Clarify | {{phase3_status}} | {{phase3_done_at}} | |
| Phase 4 | Design | {{phase4_status}} | {{phase4_done_at}} | |
| Phase 5 | Analyze | {{phase5_status}} | {{phase5_done_at}} | |
| Phase 6 | Tasks | {{phase6_status}} | {{phase6_done_at}} | |
| Phase 7 | Implement | {{phase7_status}} | {{phase7_done_at}} | |
| Phase 8 | Converge | {{phase8_status}} | {{phase8_done_at}} | |

### 阻塞项
- {{blocking_items}}

### 依赖关系
- **depends-on**: {{dependencies}}
- **blocked-by**: {{blocked_by}}