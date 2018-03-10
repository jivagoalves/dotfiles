{:user {:dependencies [[lein-cljfmt-editor "0.1.0"]
                       [jonase/eastwood "0.2.5" :exclusions [org.clojure/clojure]]]
        :plugins [[lein-cljfmt-editor "0.1.0"]
                  [jonase/eastwood "0.2.5"]]
        :repl-options {:init (require 'cljfmt.core)}
        :cljfmt {:indentation? false}}}
