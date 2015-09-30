;;; 54_javascript-mode.el --- javascript mode configuration
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(custom-set-variables '(js2-basic-offset 2))

(defun my/js2-hook ()
  "My js2 hook."
  (define-key js2-mode-map (kbd "M-j") nil))

(add-hook 'js2-mode-hook 'my/js2-hook)

;;; 54_javascript-mode.el ends here
