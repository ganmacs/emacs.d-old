;;; 20_git.el --- git mode configuration
;;; Commentary:
;;; Code:

;; emacs-github-open
(require 'github-commit-open)
(global-set-key (kbd "M-g o") 'github-commit-open)

;; magit
(require 'magit)
(global-set-key (kbd "C-M-g") 'magit-status)

;; git-gutter-fringe+
(require 'git-gutter-fringe)
(global-git-gutter-mode)

;;; 20_git.el ends here
