(autoload 'haskell-cabal "haskell-cabla" nil t)
(autoload 'haskell-simple-indent "haskell-simple-indent" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(defun my-haskell-mode-hook ()
  (define-key haskell-mode-map (kbd "M-n") 'forward-paragraph)
  (define-key haskell-mode-map (kbd "M-p") 'backward-paragraph)
  (define-key haskell-mode-map (kbd "TAB") 'haskell-simple-indent)
  (define-key haskell-mode-map (kbd "<backtab>") 'haskell-simple-indent-backtab)
  (define-key haskell-mode-map (kbd "S-TAB") 'haskell-simple-indent-backtab)
  (define-key haskell-mode-map [remap newline] 'haskell-simple-indent-newline-same-col)
  (define-key haskell-mode-map [remap newline-and-indent] 'haskell-simple-indent-newline-indent)
  )

(with-eval-after-load 'haskell-mode
     (haskell-simple-indent-mode))


;; ghc-mod

(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(autoload 'ghc-init "ghc" nil t)

(defun my/haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent)
  (setq flycheck-checker 'haskell-ghc)
  (add-to-list 'ac-sources 'ac-source-ghc-mod)
  (ghc-init))

(add-hook 'haskell-mode-hook 'my/haskell-mode-hook)
