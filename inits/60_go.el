(require 'go-autocomplete)
(ac-config-default)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'before-save-hook 'gofmt-before-save)
