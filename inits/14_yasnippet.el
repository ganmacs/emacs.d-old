;;; 14_yasnippet.el --- yasnippets mode configuration
;;; Commentary:
;;; Code:

(yas-global-mode 1)
(with-eval-after-load 'yasnippet
  (setq-default yas-snippet-dirs (concat user-emacs-directory "etc/snippets")
                yas-prompt-functions '(helm-editutil-yas-prompt))
  (yas-reload-all))
;;; 14_yasnippet.el ends here
