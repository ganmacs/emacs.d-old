;;; 31_shift.el --- shift configuration
;;; Commentary:
;;; Code:

;; point-undo
(require 'point-undo)
(global-set-key (kbd "C-=") 'point-undo)
(global-set-key (kbd "C-\\") 'point-redo)

(global-set-key (kbd "M-[") 'goto-last-change)
(global-set-key (kbd "M-]") 'goto-last-change-reverse)

;; pager
(require 'pager)
(global-set-key [up] 'pager-row-up)
(global-set-key [down] 'pager-row-down)

(require 'jumplist)
;; (global-set-key (kbd "s-j") 'jumplist--set)
(global-set-key (kbd "s-<") 'jumplist-previous)
(global-set-key (kbd "s->") 'jumplist-next)

(custom-set-variables
 '(jumplist-ex-mode t)
 '(jumplist-hook-commands
   '(helm-swoop dired-jump helm-for-files emacs-git-grep
     isearch-forward end-of-buffer beginning-of-buffer
     find-file helm-gtags-find-tag helm-imenu)
   '(jumplist-ex-mode t)))

;;; 31_shift.el ends here
