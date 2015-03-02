(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(defun my-haskell-mode-hook ()
  (ghc-init)
  (setq flycheck-checker 'haskell-ghc)
  (add-to-list 'ac-sources 'ac-source-ghc-mod)
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation)
  (define-key haskell-mode-map (kbd "M-n") 'forward-paragraph)
  (define-key haskell-mode-map (kbd "M-p") 'backward-paragraph)
  (define-key haskell-mode-map (kbd "C-h") 'haskell-indentation-delete-backward-char))

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
