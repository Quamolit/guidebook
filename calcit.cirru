
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |respo.calcit/ |respo-ui.calcit/ |respo-markdown.calcit/ |reel.calcit/ |respo-router.calcit/ |alerts.calcit/ |docs-workflow/
      :type-slots $ {} $ :dispatch-op 'docs-workflow.schema/Op
  :files $ {}
    'app.config $ %{} 'FileEntry
      :defs $ {}
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $ .unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ quote Bool
        'site $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def site
            {} $ :storage-key |workflow
          :examples $ []
          :schema $ quote $ Map Tag String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.config
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*reel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *reel (typed/new-reel schema/store)
          :examples $ []
          :schema $ quote $ Ref (typed/State docs-workflow.schema/Op docs-workflow.schema/Store)
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            when
              and config/dev? $ match op
                (:states _ _) false
                (:hydrate-storage _) true
              println |Dispatch: op
            reset! *reel $ typed/record-op updater @*reel op (generate-id!)
              :timestamp $ shared/date-now-snapshot
            , &unit
          :examples $ []
          :schema $ quote $ Fn docs-workflow.schema/Op (-> Unit) (:features :js-ffi)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (register-languages!)
            println "|Running mode:" $ if config/dev? |dev |release
            if config/dev? $ load-console-formatter!
            render-app!
            add-watch! *reel :changes $ fn (reel prev)
              hint-fn $ Fn (typed/State docs-workflow.schema/Op docs-workflow.schema/Store) (typed/State docs-workflow.schema/Op docs-workflow.schema/Store) (-> Unit)
              render-app!
            listen-devtools-toggle! |k $ fn () $ on-control! (typed/Control :toggle)
            browser/add-event-listener! |beforeunload $ fn (event)
              hint-fn $ Fn browser/EventHost $ -> Unit
              persist-storage!
            browser/set-interval! persist-storage! 60000
            ; let
              (raw (js/localStorage.getItem (:storage-key config/site)))
              when (some? raw)
                dispatch! :hydrate-storage $ parse-cirru-edn raw
            println "|App started."
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mount-target ()
            .unwrap $ respo-browser/query-selector |.app
          :examples $ []
          :schema $ quote $ Fn (-> respo.dom/DomElement) (:features :js-ffi)
        'on-control! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-control! (control)
            when config/dev? $ println |Dispatch: control
            reset! *reel $ typed/apply-control updater @*reel control
            , &unit
          :examples $ []
          :schema $ quote $ Fn typed/Control (-> Unit) (:features :js-ffi)
        'persist-storage! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn persist-storage! () (println |persist)
            browser/storage-set!
              .unwrap $ get config/site :storage-key
              format-cirru-edn $ &struct:to-map $ :store @*reel
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (nil? build-errors)
              do (remove-watch! *reel :changes) (clear-cache!)
                add-watch! *reel :changes $ fn (reel prev)
                  hint-fn $ Fn (typed/State docs-workflow.schema/Op docs-workflow.schema/Store) (typed/State docs-workflow.schema/Op docs-workflow.schema/Store) (-> Unit)
                  render-app!
                reset! *reel $ typed/refresh updater @*reel schema/store
                hud! |ok~ |Ok
              hud! |error build-errors
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render-with! (mount-target)
              fn () $ comp-container @*reel schema/docs on-control!
              , dispatch!
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            respo.core :refer $ render-with! clear-cache!
            docs-workflow.comp.container :refer $ comp-container
            app.updater :refer $ updater
            app.schema :as schema
            reel.util :refer $ listen-devtools-toggle!
            app.config :as config
            |./calcit.build-errors :default build-errors
            |bottom-tip :default hud!
            docs-workflow.config :refer $ register-languages!
            reel.typed :as typed
            js-ffi.browser :as browser
            js-ffi.shared :as shared
            respo.ffi.browser :as respo-browser
    'app.schema $ %{} 'FileEntry
      :defs $ {}
        'docs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def docs
            []
              docs-schema/DocNode :title |Guide :key :guide :content (load-doc |guide.md) :children $ []
              docs-schema/DocNode :title |Components :key :components :content (load-doc |components.md) :children $ []
                docs-schema/DocNode :title |Alpha :key :alpha :content (load-doc |components/alpha.md) :children $ []
                docs-schema/DocNode :title |Button :key :button :content (load-doc |components/button.md) :children $ []
                docs-schema/DocNode :title |comp-debug :key :comp-debug :content (load-doc |components/comp-debug.md) :children $ []
                docs-schema/DocNode :title |comp-slider :key :comp-slider :content (load-doc |components/comp-slider.md) :children $ []
                docs-schema/DocNode :title |Input :key :input :content (load-doc |components/input.md) :children $ []
                docs-schema/DocNode :title |Rotate :key :rotate :content (load-doc |components/rotate.md) :children $ []
                docs-schema/DocNode :title |Scale :key :scale :content (load-doc |components/scale.md) :children $ []
                docs-schema/DocNode :title |Translate :key :translate :content (load-doc |components/translate.md) :children $ []
              docs-schema/DocNode :title |Elements :key :elements :content (load-doc |elements.md) :children $ []
                docs-schema/DocNode :title |Arc :key :arc :content (load-doc |elements/arc.md) :children $ []
                docs-schema/DocNode :title |Image :key :image :content (load-doc |elements/image.md) :children $ []
                docs-schema/DocNode :title |Line :key :line :content (load-doc |elements/line.md) :children $ []
                docs-schema/DocNode :title |Rect :key :rect :content (load-doc |elements/rect.md) :children $ []
              docs-schema/DocNode :title "|HUD log" :key :hud :content (load-doc |hud.md) :children $ []
              docs-schema/DocNode :title |History :key :history :content (load-doc |history.md) :children $ []
          :examples $ []
          :schema $ quote $ List docs-schema/DocNode
        'load-doc $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro load-doc (filename)
            read-file $ str |docs/ filename
          :examples $ []
          :schema $ quote $ Macro Syntax
            -> $ Expr String
            :capabilities :fs-read
        'store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def store
            docs-schema/Store :states $ {} $ :cursor ([])
          :examples $ []
          :schema $ quote docs-schema/Store
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.schema
          :require $ docs-workflow.schema :as docs-schema
    'app.updater $ %{} 'FileEntry
      :defs $ {} $ 'updater
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (store op op-id op-time) (docs-updater/updater store op op-id op-time)
          :examples $ []
          :schema $ quote $ Fn docs-workflow.schema/Store docs-workflow.schema/Op String Number (-> docs-workflow.schema/Store)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require $ docs-workflow.updater :as docs-updater
