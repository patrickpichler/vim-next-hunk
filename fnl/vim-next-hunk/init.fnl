(module vim-next-hunk.main
        {require {a vim-next-hunk.aniseed.core
                  nvim vim-next-hunk.aniseed.nvim
                  utils vim-next-hunk.aniseed.nvim.util
                  strings vim-next-hunk.aniseed.string
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

(comment
  (get-hunks (nvim.fn.expand "%:p"))
  (get-hunks "Makefile"))

