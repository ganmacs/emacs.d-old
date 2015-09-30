;;; 15_flycheck.el --- flycheck mode configuration
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-pos-tip
(custom-set-variables
 '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
 '(flycheck-indication-mode 'right-fringe))

;;; 15_flycheck.el ends here
