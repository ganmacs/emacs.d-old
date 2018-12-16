;;; 22_shell.el --- mode configuration
;;; Commentary:
;;; Code:

;; exec-path-from-shell
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;; 22_shell.el ends here
