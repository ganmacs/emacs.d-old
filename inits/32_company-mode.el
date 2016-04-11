;;; 32_company-mode.el --- company mode configuration
;;; Commentary:
;;; Code:

(global-company-mode +1)
(global-set-key (kbd "C-M-i") 'company-complete)

(with-eval-after-load 'company
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq company-auto-expand t)
  (setq company-idle-delay nil)
  (setq company-tooltip-align-annotations t)

  (setq company-frontends
        '(company-pseudo-tooltip-unless-just-one-frontend
          company-preview-frontend
          company-echo-metadata-frontend))

  (let ((bgc "#333") (color "#729fcf"))
    (set-face-attribute 'company-tooltip nil
                        :foreground color :background bgc)
    (set-face-attribute 'company-tooltip-common nil
                        :foreground "white" :background bgc)
    (set-face-attribute 'company-tooltip-common-selection nil
                        :foreground "white" :background color)
    (set-face-attribute 'company-tooltip-selection nil
                        :foreground bgc :background color)
    (set-face-attribute 'company-preview-common nil
                        :background nil :foreground "lightgrey" :underline nil)
    (set-face-attribute 'company-scrollbar-fg nil
                        :background "orange")
    (set-face-attribute 'company-scrollbar-bg nil
                        :background "gray40")
    (set-face-attribute 'company-tooltip-annotation nil
                        :foreground "red")))

(defun my/company-mode ()
  "My company mode."
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<RET>") 'company-expand-top)
  (define-key company-active-map (kbd "C-m") 'company-expand-top)
  (define-key company-active-map (kbd "C-h") nil) ;override show doc
  (define-key company-active-map (kbd "M-d") 'company-show-doc-buffer) ;override show doc
  (define-key company-active-map (kbd "<Tab>") 'company-complete-common-or-cycle))
(add-hook 'company-mode-hook 'my/company-mode)

;;; 32_company-mode.el ends here
