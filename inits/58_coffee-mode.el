;;; 58_coffee-mode.el --- coffee mode configuration
;;; Commentary:
;;; Code:

(defun my/coffee-mode-hook ()
  "My coffee mode hook."
  (set (make-local-variable 'tab-width) 2)
  (set (make-local-variable 'coffee-tab-width) 2))

(add-hook 'coffee-mode-hook 'my/coffee-mode-hook)

;;; 58_coffee-mode.el ends here
