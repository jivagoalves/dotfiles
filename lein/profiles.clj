{:user {:dependencies [[lein-cljfmt-editor "0.1.0"]
                       [jonase/eastwood "0.2.5" :exclusions [org.clojure/clojure]]]
        :plugins [[lein-cljfmt-editor "0.1.0"]
                  [jonase/eastwood "0.2.5"]
                  [org.clojure/tools.nrepl "0.2.13"]
                  [cider/cider-nrepl "0.21.1"]
                  ; [venantius/ultra "0.6.0"]
                  [proto-repl "0.3.1"]
                  ]
        :repl-options {:init (require 'cljfmt.core)}
        :cljfmt {:indentation? false}}}
