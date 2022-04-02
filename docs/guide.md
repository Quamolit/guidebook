# Quamolit in calcit-js

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

Define components:

```cirru
defcomp comp-demo ()
  group ({})

defcomp comp-demo-tick (states)
  let
      cursor $ :cursor states
      state $ or (:data states) {} (:demo :demo)
    []
      fn (elapsed d!)
        ; "this is there you handle animation states"
        d! cursor (merge state state-changes)
      group ({})
        group ({})
```

It requires some boilerplate code to start a Quamolit project. I would suggest starting by forking my [workflow](https://github.com/Quamolit/quamolit-workflow).

### Develop

To run this project, with [calcit_runner](https://github.com/calcit-lang/calcit_runner.rs) and [Vite](https://vitejs.dev/):

```bash
yarn
cr --emit-js --once
yarn vite
```
