(require 'smartparens-config)

(smartparens-global-mode t)
(show-smartparens-global-mode t)

(sp-pair "(" ")" :wrap "C-(")
(global-set-key (kbd "C-S-k") 'sp-kill-hybrid-sexp)
(global-set-key (kbd "s-T") 'sp-transpose-hybrid-sexp)
(global-set-key (kbd "C-)") 'sp-slurp-hybrid-sexp)
(global-set-key (kbd "M-(") 'sp-push-hybrid-sexp)
(global-set-key (kbd "s-S-t") 'sp-transpose-hybrid-sexp)
(global-set-key (kbd "s-u") 'sp-up-sexp)
(global-set-key (kbd "s-d") 'sp-down-sexp)

(custom-set-faces
 '(sp-pair-overlay-face ((t (:inherit default))))
 '(sp-show-pair-match-face ((t (:background "black" :foreground "green" :weight semi-bold)))))

(eval-after-load "ruby-mode"
  '(progn (require 'smartparens-ruby)))

(eval-after-load "web-mode"
  '(progn (require 'smartparens-html)))

(eval-after-load "rhtml-mode"
  '(progn (require 'smartparens-html)))

;; Emacs 24.4 からなくなったので
(unless (fboundp 'cua-replace-region)
  (defun cua-replace-region ()
    "Replace the active region with the character you type."
    (interactive)
    (let ((not-empty (and cua-delete-selection (cua-delete-region))))
      (unless (eq this-original-command this-command)
        (let ((overwrite-mode
               (and overwrite-mode
                    not-empty
                    (not (eq this-original-command 'self-insert-command)))))
          (cua--fallback))))))
