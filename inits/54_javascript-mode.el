;;; 54_javascript-mode.el --- javascript mode configuration
;;; Commentary:
;;; Code:


(with-eval-after-load 'js2-mode
  (define-key js2-mode-map (kbd "M-j") nil))

(custom-set-variables '(js2-basic-offset 2))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;;; 54_javascript-mode.el ends here
