;;; 15_smartparens.el --- smartparens mode configuration
;;; Commentary:
;;; Code:

(require 'smartparens-config)

(sp-pair "(" ")" :wrap "C-(")
(global-set-key (kbd "C-S-k") 'sp-kill-hybrid-sexp)
(global-set-key (kbd "s-t") 'sp-transpose-hybrid-sexp)
(global-set-key (kbd "C-)") 'sp-slurp-hybrid-sexp)
(global-set-key (kbd "M-(") 'sp-push-hybrid-sexp)
(global-set-key (kbd "s-u") 'sp-up-sexp)
(global-set-key (kbd "s-d") 'sp-down-sexp)

(custom-set-faces
 '(sp-pair-overlay-face ((t (:inherit default))))
 '(sp-show-pair-match-face ((t (:background "black" :foreground "green" :weight semi-bold)))))

(custom-set-variables
 '(smartparens-global-mode t)
 '(show-smartparens-global-mode t))


(with-eval-after-load "ruby-mode"
  (require 'smartparens-ruby))

(with-eval-after-load "web-mode"
  (require 'smartparens-html))

(with-eval-after-load "rhtml-mode"
  (require 'smartparens-html))

;;; 15_smartparens.el ends here
