## Quamolit Calcit Guide Book

```bash
cargo install mdbook
cargo install mdbook-linkcheck

mdbook serve
```

### License

MIT

### Calcit migration

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
destinations and `mdbook.html` are preserved. Remote CI, mdBook/upload checks,
review and production deployment remain to be accepted. Historical code blocks
inside the documentation still need their own API migration review.

The 0.30.1 candidate migrates internal Option helpers to public methods, checks
real render and operation boundaries, and delegates the same-signature updater
to the published checked Docs Workflow implementation. Valid operations and Map
archives stay compatible; invalid operations fail at the actual boundary.
Unknown updater operation logging follows the shared implementation's stderr.
The original `hud!` error/success display is retained, not replaced with raise.

CI retains existing gates and adds public namespace and full strict checks.
PR artifacts preserve both original frontend outputs for actual acceptance.
Temporary formal-CLI migration inputs must be removed before final clean CI.
The introductory guide retires its incomplete ticking example and retired runner
commands, without claiming the separate Quamolit library/template is migrated.
