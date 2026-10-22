# Quamolit in Calcit

> what if we describe UI transitions in React's way? Previously written in [ClojureScript](https://github.com/Quamolit/quamolit.cljs).

Demo <http://r.quamolit.org/quamolit.calcit/>

Features:

- declarative component markups for Canvas
- React-like components, element DSLs, event handlers, global Store
- animation abstractions

### Design

Quamolit is trying to combine two things:

- declarative programming experience like React
- canvas API drawing and animations

Seeing from MVC, animations has Models too. Said by FRP(Functional Reactive Programming), the Model for animations is values changing over time, like a stream. It does have a Model, a Model for animations. But we want to program in a declarative way, which means we need that Model to be generated from our code. Meanwhile CSS animations is not we want because of the private animation states, we need global app state. So question, how to expression a time varying Model with declarative code?

### Usage

Quamolit describes canvas components declaratively. A minimal DSL fragment is:

```cirru
defcomp comp-demo ()
  group ({})
```

This fragment is not a standalone program: imports, schemas, mounting and the
library's own typed state/event contracts belong to the application. The old
tick example used an undefined `state-changes` and an unchecked Map fallback;
it is retired rather than presented as working current initialization code.

The separate [Quamolit workflow](https://github.com/Quamolit/quamolit-workflow)
is the application-template repository. Check its own `deps.cirru`, paired
`@calcit/procs` version and current library APIs before starting a project;
this documentation site's upgrade does not establish that template or the
Quamolit library as migrated to 0.30.1. Do not copy an old two-argument dispatch
signature into a current application without checking its actual contract.

### Develop this documentation site

This site uses paired formal Calcit/procs 0.30.1 and the published Docs Workflow
dependency. Use the current Calcit CLI, not the retired `cr`/calcit_runner command:

```bash
caps --strict --ci
corepack yarn install --immutable
caps verify --toolchain
calcit calcit.cirru js
corepack yarn vite
```

Edit `calcit.cirru` through official Calcit structured editing commands, not raw
Snapshot text. Keep the existing `hud!` page error/success display during hot
reload. Docs Workflow navigation uses typed Store/Op values; the documentation
application dispatch accepts a single Enum, checks its payloads and returns Unit.
Its 60-second Map archive write and originally disabled restoration are unchanged.
