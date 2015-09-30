;;; 28_zlc.el --- zlc mode configuration
;;; Commentary:
;;; Code:

(zlc-mode t)
(custom-set-variables '(zlc-select-completion-immediately nil))

(with-eval-after-load "zlc"
  (define-key minibuffer-local-map (kbd "C-n")     'zlc-select-next-vertical)
  (define-key minibuffer-local-map (kbd "C-p")     'zlc-select-previous-vertical)
  (define-key minibuffer-local-map (kbd "<down>")  'zlc-select-next-vertical)
  (define-key minibuffer-local-map (kbd "<up>")    'zlc-select-previous-vertical)
  (define-key minibuffer-local-map (kbd "<right>") 'zlc-select-next)
  (define-key minibuffer-local-map (kbd "<left>")  'zlc-select-previous)
  (define-key minibuffer-local-map (kbd "C-c") 'zlc-reset))

;;; 28_zlc.el ends here
