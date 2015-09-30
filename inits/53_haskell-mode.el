;;; 53_haskell-mode.el --- mode configuration
;;; Commentary:
;;; Code:

(with-eval-after-load 'haskell-mode
  (define-key haskell-mode-map (kbd "M-n") 'forward-paragraph)
  (define-key haskell-mode-map (kbd "M-p") 'backward-paragraph))

(defun my/haskell-mode-hook ()
  "My haskell mode hook."
  (ghc-init)
  (setq flycheck-checker 'haskell-ghc)
  (add-to-list 'ac-sources 'ac-source-ghc-mod)
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation))

(add-hook 'haskell-mode-hook 'my/haskell-mode-hook)

;;; 53_haskell-mode.el ends here
