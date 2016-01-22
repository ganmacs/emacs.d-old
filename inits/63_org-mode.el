;;; 63_org-mode.el --- org mode configuration
;;; Commentary:
;;; Code:

(defun my/org-mode-hook ()
  )

(custom-set-variables
 '(org-directory "~/Dropbox/org")
 )

(add-hook 'org-mode-hook 'my/org-mode-hook)

(with-eval-after-load 'org-mode
  (define-key org-mode-map (kbd "C-j") 'dabbrev-expand)
  (define-key org-mode-map (kbd "M-h") 'backward-kill-word)
  (define-key org-mode-map (kbd "C-,") 'undo-tree-redo))

;;; 63_org-mode.el ends here
