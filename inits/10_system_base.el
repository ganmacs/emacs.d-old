;;; 10_base.el --- base settings
;;; Commentary:
;;; Code:

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package dumb-jump
  :bind (("C-#" . dumb-jump-go)
         ("C-$" . dumb-jump-back)))

(use-package expand-region
  :bind ("C-@" . er/expand-region))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this))
  :config
  (setq mc/list-file "~/.emacs.d/log/.mc-lists.el"))

(use-package anzu
  :bind (("C-%" . anzu-replace-at-cursor-thing)
         ("M-%" . anzu-query-replace-at-cursor))
  :config (global-anzu-mode +1))

(use-package open-junk-file
  :bind ("C-x j" . open-junk-file)
  :config
  (setq
   open-junk-file-find-file-function 'find-file
   open-junk-file-format "~/Documents/Junk/%Y/%m%d-%H%M%S."))

(use-package zlc
  :init (zlc-mode t)
  :bind (:map minibuffer-local-map
              ("C-n"  . zlc-select-next-vertical)
              ("C-p" . zlc-select-previous-vertical)
              ("<down>" . zlc-select-next-vertical)
              ("<up>" . zlc-select-previous-vertical)
              ("<right>" . zlc-select-next)
              ("<left>" . zlc-select-previous)
              ("C-c" . zlc-reset))
  :config
  (setq zlc-select-completion-immediately nil))

;;; 10_base.el ends here
