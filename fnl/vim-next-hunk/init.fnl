(module vim-next-hunk.main
        {require {a vim-next-hunk.aniseed.core
                  nvim vim-next-hunk.aniseed.nvim
                  utils vim-next-hunk.utils
                  fun vim-next-hunk.fun
                  lume vim-next-hunk.lume}})

(defn get-hunks [file]
  (let [result {}]
    (each [start end (string.gmatch
                      (nvim.fn.system (.. "git diff --no-ext-diff --no-color -U0 -- " file))
                      "@@%s*[-]%d*,?[^ ]*%s*[+](%d*),?([^ ]*)%s*@@")]
          (if (and (not= start "") (not= end ""))
            (lume.push result [(tonumber start) (tonumber end)])
            (not= start "")
            (lume.push result [(tonumber start) (tonumber start)])))
    result))

(defn get-next-changed-file [file compare]
  (let [repo-file-name (nvim.fn.system (.. "git ls-files --full-name -- " file))]
    (if (not= repo-file-name "")
      (let [(ok? val-or-msg)
              (pcall fun.head
                (fun.drop_while (fn [x] (not (compare file x)))
                                (fun.filter (fn [x] (not= x ""))
                                            (lume.split (nvim.fn.system "git ls-files --full-name -m") "\n"))))]
        (if ok?
          val-or-msg
          nil))
      )))

(comment
  (lume.map (lume.split (nvim.fn.system "git ls-files --full-name -m") "\n") (fn [x] (< x "a")))
  (get-next-changed-file "Makefile" (fn [a b] (and (not= a b) (< a b))))
  (get-next-changed-file "fnl/vim-next-hunk/init.fnl" (fn [a b] (and (not= a b) (< a b))))
  (get-next-changed-file "Makefile" (fn [a b] (do (nvim.print a b) (and (not= a b) (> a b)))))
  (get-next-changed-file "Makefile" (fn [a b] (do (nvim.print a b) true)))
  (get-next-changed-file "Makefile" (fn [a b] (> a b)))
  (fun.drop_while (fn [x] (do (nvim.print x) false)) (nvim.fn.system "git ls-files --full-name -m"))
  (< ".gitignore" "script")
  (= "Makefile" "Makefile")
  (< "fnl/vim-next-hunk/init.fnl" "Makefile")
  (> "Makefile" "fnl")
  (> "Makefile" "Makefile")
  (get-hunks (nvim.fn.expand "%:p"))
  (get-hunks "Makefile"))

