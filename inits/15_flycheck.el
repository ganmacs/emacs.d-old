;;; 15_flycheck.el --- flycheck mode configuration
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-pos-tip
(custom-set-variables
 '(flycheck-indication-mode 'right-fringe))

(with-eval-after-load 'flycheck
  (flycheck-popup-tip-mode 1))

;;; 15_flycheck.el ends here
