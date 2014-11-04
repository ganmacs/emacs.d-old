;; emacs-github-open
(require 'emacs-github-open)
(global-set-key (kbd "M-g o") 'emacs-github-open)

;; magit
(global-set-key (kbd "C-M-g") 'magit-status)

;; git-gutter-fringe+
(require 'git-gutter-fringe)
(global-git-gutter-mode)
