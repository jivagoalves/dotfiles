{:user {:dependencies [[lein-cljfmt "0.5.7"]
                       [jonase/eastwood "0.2.5" :exclusions [org.clojure/clojure]]]
        :repl-options {:init (require 'cljfmt.core)}}}
