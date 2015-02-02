;; emacs-github-open
(require 'emacs-github-open)
(global-set-key (kbd "M-g o") 'emacs-github-open)

;; magit
(require 'magit)
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
