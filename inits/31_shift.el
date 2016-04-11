;;; 31_shift.el --- shift configuration
;;; Commentary:
;;; Code:

(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  "Define macro with PREFIX and C as char and MODE is char or word."
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-char-mode
                  #'ace-jump-word-mode) ,c))))

(cl-loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "A-" c))
(cl-loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "A-" c))
(cl-loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "A-" c))
(cl-loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "A-C-" c 'word))
(cl-loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "A-C-" c 'word))
(cl-loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "A-C-" c 'word))

;; avy
(global-set-key (kbd "M-g l") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)

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
