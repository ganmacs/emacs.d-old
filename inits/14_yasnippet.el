;;; 14_yasnippet.el --- yasnippets mode configuration
;;; Commentary:
;;; Code:

(setq yas-snippet-dirs '("~/.emacs.d/etc/snippets"))
(yas-global-mode 1)
(setq yas/prompt-functions '(yas/dropdown-prompt))

;;; 14_yasnippet.el ends here
