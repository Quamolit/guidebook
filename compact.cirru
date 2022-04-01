
{} (:package |docs-workflow)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!)
    :modules $ [] |respo.calcit/ |lilac/ |memof/ |respo-ui.calcit/ |respo-markdown.calcit/ |reel.calcit/ |respo-router.calcit/ |alerts.calcit/ |docs-workflow/
    :version |0.0.1
  :entries $ {}
  :files $ {}
    |app.schema $ {}
      :ns $ quote (ns app.schema)
      :defs $ {}
        |store $ quote
          def store $ {}
            :states $ {}
              :cursor $ []
        |docs $ quote
          def docs $ []
            {} (:title "\"Guide") (:key :guide)
              :content $ load-doc "\"guide.md"
            {} (:title "\"Components") (:key :components)
              :content $ load-doc "\"components.md"
              :children $ []
                {} (:title "\"Alpha") (:key :alpha)
                  :content $ load-doc "\"components/alpha.md"
                {} (:title "\"Button") (:key :button)
                  :content $ load-doc "\"components/button.md"
                {} (:title "\"comp-debug") (:key :comp-debug)
                  :content $ load-doc "\"components/comp-debug.md"
                {} (:title "\"comp-slider") (:key :comp-slider)
                  :content $ load-doc "\"components/comp-slider.md"
                {} (:title "\"Input") (:key :input)
                  :content $ load-doc "\"components/input.md"
                {} (:title "\"Rotate") (:key :rotate)
                  :content $ load-doc "\"components/rotate.md"
                {} (:title "\"Scale") (:key :scale)
                  :content $ load-doc "\"components/scale.md"
                {} (:title "\"Translate") (:key :translate)
                  :content $ load-doc "\"components/translate.md"
            {} (:title "\"Elements") (:key :elements)
              :content $ load-doc "\"elements.md"
              :children $ []
                {} (:title "\"Arc") (:key :arc)
                  :content $ load-doc "\"elements/arc.md"
                {} (:title "\"Image") (:key :image)
                  :content $ load-doc "\"elements/image.md"
                {} (:title "\"Line") (:key :line)
                  :content $ load-doc "\"elements/line.md"
                {} (:title "\"Rect") (:key :rect)
                  :content $ load-doc "\"elements/rect.md"
            {} (:title "\"HUD log") (:key :hud)
              :content $ load-doc "\"hud.md"
            {} (:title "\"History") (:key :history)
              :content $ load-doc "\"history.md"
        |load-doc $ quote
          defmacro load-doc (filename)
            read-file $ str "\"docs/" filename
    |app.updater $ {}
      :ns $ quote
        ns app.updater $ :require
          respo.cursor :refer $ update-states
      :defs $ {}
        |updater $ quote
          defn updater (store op data op-id op-time)
            case-default op
              do (println "\"unknown op:" op) store
              :states $ update-states store data
              :hydrate-storage data
    |app.main $ {}
      :ns $ quote
        ns app.main $ :require
          respo.core :refer $ render! clear-cache!
          docs-workflow.comp.container :refer $ comp-container
          app.updater :refer $ updater
          app.schema :as schema
          reel.util :refer $ listen-devtools!
          reel.core :refer $ reel-updater refresh-reel
          reel.schema :as reel-schema
          app.config :as config
          "\"./calcit.build-errors" :default build-errors
          "\"bottom-tip" :default hud!
          "\"highlight.js" :default hljs
          "\"highlight.js/lib/languages/bash" :default bash-lang
          "\"highlight.js/lib/languages/clojure" :default clojure-lang
      :defs $ {}
        |render-app! $ quote
          defn render-app! () $ render! mount-target (comp-container @*reel schema/docs) dispatch!
        |persist-storage! $ quote
          defn persist-storage! () (js/console.log "\"persist")
            js/localStorage.setItem (:storage-key config/site)
              format-cirru-edn $ :store @*reel
        |mount-target $ quote
          def mount-target $ .!querySelector js/document |.app
        |*reel $ quote
          defatom *reel $ -> reel-schema/reel (assoc :base schema/store) (assoc :store schema/store)
        |main! $ quote
          defn main! () (.!registerLanguage hljs "\"clojure" clojure-lang) (.!registerLanguage hljs "\"bash" bash-lang)
            println "\"Running mode:" $ if config/dev? "\"dev" "\"release"
            if config/dev? $ load-console-formatter!
            render-app!
            add-watch *reel :changes $ fn (reel prev) (render-app!)
            listen-devtools! |k dispatch!
            js/window.addEventListener |beforeunload $ fn (event) (persist-storage!)
            flipped js/setInterval 60000 persist-storage!
            ; let
                raw $ js/localStorage.getItem (:storage-key config/site)
              when (some? raw)
                dispatch! :hydrate-storage $ parse-cirru-edn raw
            println "|App started."
        |dispatch! $ quote
          defn dispatch! (op op-data)
            when
              and config/dev? $ not= op :states
              println "\"Dispatch:" op
            reset! *reel $ reel-updater updater @*reel op op-data
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (remove-watch *reel :changes) (clear-cache!)
              add-watch *reel :changes $ fn (reel prev) (render-app!)
              reset! *reel $ refresh-reel @*reel schema/store updater
              hud! "\"ok~" "\"Ok"
            hud! "\"error" build-errors
    |app.config $ {}
      :ns $ quote (ns app.config)
      :defs $ {}
        |dev? $ quote
          def dev? $ = "\"dev" (get-env "\"mode")
        |site $ quote
          def site $ {} (:storage-key "\"workflow")