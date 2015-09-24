;;; 60_go.el --- go mode configuration
;;; Commentary:
;;; Code:

(require 'go-autocomplete)
(ac-config-default)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'before-save-hook 'gofmt-before-save)

;;; 60_go.el ends here
