## Quamolit Calcit Guide Book

```bash
cargo install mdbook
cargo install mdbook-linkcheck

mdbook serve
```

### License

MIT

### Calcit 0.41.0 升级

开发使用配对的 Calcit CLI 和 `@calcit/procs` 0.41.0。文档导航通过具名 `docs-workflow.schema/Op` 派发。Reel 0.11 的面板和快捷键使用独立的 `reel.typed/Control` 回调，由 Docs Workflow 0.1.0 的组件接收。

### Calcit 0.32.1 迁移记录

文档站配对正式 Calcit CLI / `@calcit/procs` **0.32.1** 与已发布 Docs Workflow **0.0.40**。
请重新安装完整模块图、生成 JS 并刷新页面，UI 样式可能有差异。严格 Caps 已安装八个已发布模块，
不再使用本地候选模块；共享依赖仍固定部分 alpha tag，不宣称整张模块图均为稳定版。

官方 formatter 转换 4 处旧类型形式，13 个定义的 schema 保持。默认 entry 显式绑定
`dispatch-op :dynamic`，对应原 renderer 的 `Dynamic → Unit` 宿主合同；非 Enum 拒绝和
业务 payload 检查保持。保留 `hud!` 页面错误提示，不增加强转或放宽类型门禁。
原文档节点层级、60 秒 Map 存档写入和禁用的恢复行为保持；不宣称刷新恢复存档。

使用 Node 24、Yarn 4.18.0；依赖等待期统一为一小时，无按版本豁免。
240 个可达定义、13 个公开定义、完整 strict、不可变安装、工具链配对和 Vite/mdBook 构建通过。
项目没有附带测试，不新增空测试或额外验证框架。实际 SPA 的 Components/Button、快速跳转到 Rect、
Escape 关闭与刷新回 Guide 通过；原 mdbook.html 入口及 Button 深层链接通过。
SPA 无警告或错误；mdBook 缺少 Cirru 语言注册，代码块回退为纯文本并报警，见
[#6](https://github.com/Quamolit/guidebook/issues/6)。不把这个已知问题写成高亮验收通过。
本轮未操作剪贴板、真实存档或外部应用，远端 CI 结果另记于 PR。
历史 Canvas DSL 文档不代表新版 Quamolit 库和模板已通过 0.32.1 验收。
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
