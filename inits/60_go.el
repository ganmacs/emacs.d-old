;;; 60_go.el --- go mode configuration
;;; Commentary:
;;; Code:

(with-eval-after-load 'go-mode
  (define-key go-mode-map (kbd "M-.") 'godef-jump))


(require 'go-autocomplete)
(defun my/golang-mode ()
  "My go-lang mode"
  (setq gofmt-command "goimports")
  (ac-config-default))

(add-hook 'go-mode-hook 'my/golang-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'before-save-hook 'gofmt-before-save)

(defvar my/helm-go-source
  '((name . "Helm Go")
    (candidates . (lambda ()
                    (cons "builtin" (go-packages))))
    (action . (("Show document" . godoc)
               ("Import package" . my/helm-go-import-add)))))

(defun my/helm-go-import-add (candidate)
  (dolist (package (helm-marked-candidates))
    (go-import-add current-prefix-arg package)))

(defun my/godoc ()
  (interactive)
  (helm :sources '(my/helm-go-source) :buffer "*helm go*"))

;;; 60_go.el ends here
