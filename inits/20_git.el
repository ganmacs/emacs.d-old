;;; 20_git.el --- git mode configuration
;;; Commentary:
;;; Code:

;; emacs-github-open
;; (require 'github-commit-open)
;; (global-set-key (kbd "M-g o") 'github-commit-open)

;; magit
(require 'magit)
(global-set-key (kbd "C-M-g") 'magit-status)

;; git-gutter-fringe+
(require 'git-gutter-fringe)
(global-git-gutter-mode)

;; git commmit
(add-hook 'git-commit-mode-hook 'my-git-commit-hook)
(defun my-git-commit-hook ()
  "My git commit mode hook."
  (save-selected-window (magit-process-buffer))
  (git-commit-turn-on-flyspell)
  (define-key flyspell-mode-map (kbd "C-.") 'other-window))

;;; 20_git.el ends here
