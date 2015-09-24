;;; 20_git.el --- git mode configuration
;;; Commentary:
;;; Code:

;; emacs-github-open
(require 'github-commit-open)
(global-set-key (kbd "M-g o") 'github-commit-open)

;; magit
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key (kbd "C-M-g") 'magit-status)

(defun git-now ()
  (interactive)
  (if (y-or-n-p "$ git now")
      (progn
        (call-process "git" nil "*git now*" nil "now")
        (pop-to-buffer "*git now*" t nil)
        (message "git now Done!"))))

(define-key magit-mode-map (kbd "N") 'git-now)

;; git-gutter-fringe+
(require 'git-gutter-fringe)
(global-git-gutter-mode)

;;; 20_git.el ends here
