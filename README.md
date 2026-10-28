## Quamolit Calcit Guide Book

```bash
cargo install mdbook
cargo install mdbook-linkcheck

mdbook serve
```

### License

MIT

### 本轮升级影响

文档站候选配对正式 Calcit CLI / `@calcit/procs` **0.32.0** 与 Docs Workflow **0.0.40** 候选。
当前仅使用本地候选模块联合验证；尚未证明已发布依赖图的 Caps strict 安装，须等上游 tag
发布后再验证干净安装和 PR CI。升级后重装依赖并刷新页面，UI 样式可能有差异。

官方 formatter 转换 4 处旧类型形式，13 个定义的 schema 保持。默认 entry 显式绑定
`dispatch-op :dynamic`，对应原 renderer 的 `Dynamic → Unit` 宿主合同；非 Enum 拒绝和
业务 payload 检查保持。保留 `hud!` 页面错误提示，不增加强转或放宽类型门禁。
原文档节点层级、60 秒 Map 存档写入和禁用的恢复行为保持；不宣称刷新恢复存档。

使用 Node 24、Yarn 4.18.0；依赖等待期统一为一小时，无按版本豁免。
项目没有附带测试；完整 strict、公开 namespace 和双前端构建不能代替实际页面验收。
历史 Canvas DSL 文档不代表新版 Quamolit 库和模板已通过 0.32.0 验收。
不生成 compact/package.cirru，不提交 js-out；原 COS 内置 verify、PR 隔离前缀、
两个前端服务器目标和 mdbook.html 保持。本轮不合并、部署或发版。

### 先前迁移记录

以下 0.30.1 内容描述先前迁移，不作为本轮依赖图验收证据。

This candidate targets formal Calcit/procs 0.30.1 and published Docs Workflow 0.0.37,
installed through a strict, versioned Caps dependency graph. The local package
is `app`, avoiding a collision with the shared Docs Workflow module.

All 13 definitions use current typed DocNode/Store/Op/Reel contracts, defref,
single-Enum dispatch and checked browser adapters. The 17 document nodes keep
their original titles, keys, content references and hierarchy. The 60-second
timer, Map storage format and originally disabled restoration are preserved.

The earlier 0.29.2 candidate's 239-definition check, immutable Yarn installation, paired toolchain,
CDN production build and actual Guide/Components/Button navigation passed
locally; those historical results do not accept the new 0.30.1 graph.
Browser reload triggers persistence and retains the original reset
behavior, without runtime errors. Old unused Lilac/Memof imports and the unused
Speech package are removed. Styles come from the versioned Caps module.

`compact.cirru` is retired after source/build/browser acceptance and remains
recoverable from Git history. Generated `js-out` is not tracked. CI builds both
the frontend and mdBook; COS verification uses only the action's built-in
public URL check. PR uploads are isolated and never rsync. Both original server
destinations and `mdbook.html` are preserved. Current formal CI, mdBook/upload
and browser evidence is recorded in the migration PR; review and production
deployment are separate acceptance decisions. Historical code blocks
inside the documentation still need their own API migration review.

The 0.30.1 candidate migrates internal Option helpers to public methods, checks
real render and operation boundaries, and delegates the same-signature updater
to the published checked Docs Workflow implementation. Valid operations and Map
archives stay compatible; invalid operations fail at the actual boundary.
Unknown updater operation logging follows the shared implementation's stderr.
The original `hud!` error/success display is retained, not replaced with raise.

CI retains existing gates and adds public namespace and full strict checks.
PR artifacts preserve both original frontend outputs for actual acceptance.
Temporary formal-CLI migration inputs have been removed before final clean CI.
The introductory guide retires its incomplete ticking example and retired runner
commands, without claiming the separate Quamolit library/template is migrated.
It explicitly labels these pages as historical Canvas DSL documentation and
links the upstream's current API/migration contract; the current guarded alpha
motion API does not make experimental renderer/resource APIs stable.
