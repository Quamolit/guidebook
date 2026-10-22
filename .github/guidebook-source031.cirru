[]
  [] |tree |replace |app.config/dev? |--path |@2.2.0 |--input-format |cirru |--code
    quote .unwrap-or
  [] |tree |replace |app.main/mount-target |--path |@3.0 |--input-format |cirru |--code
    quote .unwrap
  [] |tree |replace |app.main/persist-storage! |--path |@4.1.0 |--input-format |cirru |--code
    quote .unwrap
  [] |edit |imports |app.updater |--input-format |cirru |--code
    quote $ []
      docs-workflow.updater :as docs-updater
  [] |tree |replace |app.updater/updater |--path |@3 |--input-format |cirru |--code
    quote $ docs-updater/updater store op op-id op-time
  [] |tree |replace |app.main/dispatch! |--path |@4.2.2.3.1.3 |--input-format |cirru |--code
    quote $ match op
      (:states cursor data)
        match (try-decode-map-as cursor $ :: 'List 'Dynamic)
          (:ok checked-cursor) (docs-workflow.schema/Op :states checked-cursor data)
          (:err message) (raise message)
      (:hydrate-storage data)
        match
          try-decode-map-as
            if (struct? data) (&struct:to-map data) data
            , 'docs-workflow.schema/Store
          (:ok checked-store) (docs-workflow.schema/Op :hydrate-storage checked-store)
          (:err message) (raise message)
      _ $ raise "|Unknown Docs Workflow operation"
  [] |tree |replace |app.main/render-app! |--path |@3.3 |--input-format |cirru |--code
    quote $ fn (op)
      hint-fn $ {} (:args $ [] 'Dynamic) (:return 'Unit) (:features $ #{} :js-ffi)
      if (enum? op) (dispatch! op) (raise "|Expected an Enum render action")
      , &unit
