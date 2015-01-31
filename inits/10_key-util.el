;; smartrep
(require 'smartrep)
(global-unset-key (kbd "C-:"))
(smartrep-define-key global-map "C-:"
                     '(("b" . 'point-undo)
                       ("f" . 'point-redo)
                       ("h" . 'windmove-left)
                       ("j" . 'windmove-down)
                       ("k" . 'windmove-up)
                       ("l" . 'windmove-right)
                       ("p" . 'pager-row-up)
                       ("n" . 'pager-row-down)
                       ("r" . 'point-to-register)
                       ("s" . 'jump-to-register)
                       ("t" . 'rotate-window)
                       ("T" . 'rotate-layout)
                       ("v" . 'pager-page-down)
                       ("V" . 'pager-page-up)
                       ("<left>" . (shrink-window-horizontally 1))    ;; ウインドウサイズ変換
                       ("<right>" . (shrink-window-horizontally -1))
                       ("<up>" . (shrink-window -1))
                       ("<down>" . (shrink-window 1))
                       ))


;; key-chord
(key-chord-mode 1)
(key-chord-define-global "NN" 'forward-list)
(key-chord-define-global "PP" 'backward-list)
(setq key-chord-two-keys-delay 0.05)



;; emacs-surrround
(require 'emacs-surround)
(global-set-key (kbd "s-w") 'emacs-surround)
(add-to-list 'emacs-surround-alist '("}" . ("{ " . " }")))
