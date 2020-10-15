(module vim-next-hunk.main
        {require {a vim-next-hunk.aniseed.core
                  nvim vim-next-hunk.aniseed.nvim
                  utils vim-next-hunk.aniseed.nvim.util
                  }})

; (let [f nvim.fn.buffers]
;   (a.println (f "a")))

; (a.println (nvim.api.nvim_call_function "buffers"))
; (a.println (nvim.fn.buffers))
; (a.println "-->" utils.with-out-str)
; (a.println (utils.with-out-str nvim.ex.buffers))

; (a.println (nvim.fn.nvim_list_bufs))
(a.println (nvim.fn.system "ls"))
; (nvim.ex.echo "\"hi\"")
; (a.println (nvim.fn:buffers))

