## Quamolit Calcit Guide Book

```bash
cargo install mdbook
cargo install mdbook-linkcheck

mdbook serve
```

### License

MIT

### Calcit migration

This candidate uses formal Calcit/procs 0.29.2 and Docs Workflow 0.0.35,
installed through a strict, versioned Caps dependency graph. The local package
is `app`, avoiding a collision with the shared Docs Workflow module.

All 13 definitions use current typed DocNode/Store/Op/Reel contracts, defref,
single-Enum dispatch and checked browser adapters. The 17 document nodes keep
their original titles, keys, content references and hierarchy. The 60-second
timer, Map storage format and originally disabled restoration are preserved.

The 239-definition strict check, immutable Yarn installation, paired toolchain,
CDN production build and actual Guide/Components/Button navigation passed
locally. Browser reload triggers persistence and retains the original reset
behavior, without runtime errors. Old unused Lilac/Memof imports and the unused
Speech package are removed. Styles come from the versioned Caps module.

`compact.cirru` is retired after source/build/browser acceptance and remains
recoverable from Git history. Generated `js-out` is not tracked. CI builds both
the frontend and mdBook; COS verification uses only the action's built-in
public URL check. PR uploads are isolated and never rsync. Both original server
destinations and `mdbook.html` are preserved. Remote CI, mdBook/upload checks,
review and production deployment remain to be accepted. Historical code blocks
inside the documentation still need their own API migration review.
