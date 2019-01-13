;;; 14_yasnippet.el --- yasnippets mode configuration
;;; Commentary:
;;; Code:

(custom-set-variables
 '(yas-snippet-dirs (list (concat user-emacs-directory "etc/snippets")))
 '(yas-prompt-functions '(helm-editutil-yas-prompt))
 '(yas-global-mode 1))

(with-eval-after-load 'yasnippet (yas-reload-all))

;;; 14_yasnippet.el ends here
