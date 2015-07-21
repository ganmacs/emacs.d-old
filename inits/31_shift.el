(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-char-mode
                  #'ace-jump-word-mode) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "A-" c))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "A-" c))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "A-" c))
(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "A-C-" c 'word))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "A-C-" c 'word))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "A-C-" c 'word))

;; avy
(global-set-key (kbd "M-g l") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)

;; point-undo
(require 'point-undo)
(global-set-key (kbd "C-=") 'point-undo)

(global-set-key (kbd "M-[") 'goto-last-change)
(global-set-key (kbd "M-]") 'goto-last-change-reverse)


;; pager
(require 'pager)
(global-set-key [up] 'pager-row-up)
(global-set-key [down] 'pager-row-down)
