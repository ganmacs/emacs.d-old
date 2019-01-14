;;; 13_company-mode.el --- company mode configuration
;;; Commentary:
;;; Code:

(use-package company
  :bind (("M-/" .  company-complete)
         ("C-M-i" .  company-complete)
         :map company-active-map
         ("M-n" . nil)
         ("M-p" . nil)
         ("C-n" . 'company-select-next)
         ("C-p" . 'company-select-previous)
         ("C-h" . nil)
         ("M-d" . 'company-show-doc-buffer)
         ("<RET>" .  'company-complete-selection)
         ("<tab>". 'company-complete-selection)
         ("TAB" . 'company-complete-selection)
         ("C-m" . 'company-complete-selection))
  :config
  (global-company-mode +1)
  (setq company-selection-wrap-around t)
  (setq company-minimum-prefix-length 5)
  (setq company-auto-expand t)
  (setq company-idle-delay 0)
  (setq company-tooltip-align-annotations t)
  (setq company-dabbrev-ignore-case nil)
  (setq company-dabbrev-code-ignore-case nil)
  (setq company-dabbrev-downcase nil)
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

(use-package company-dict
  :config
  (setq company-dict-dir (concat user-emacs-directory "etc/ac-dict"))
  (add-to-list 'company-backends 'company-dict))


;;; 13_company-mode.el ends here
