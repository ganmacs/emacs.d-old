;;; 56_markup-mode.el --- mode configuration
;;; Commentary:
;;; Code:

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . web-mode))

(custom-set-faces
 '(web-mode-html-tag-bracket-face
   ((t (:foreground "#edd400" :weight bold)))) ; カッコ
 '(web-mode-html-tag-face
   ((t (:foreground "#edd400" :weight bold)))) ; 要素名
 '(web-mode-symbol-face
   ((t (:foreground "#FF7400")))))

(with-eval-after-load 'web-mode
  (define-key web-mode-map (kbd "C-;") 'helm-for-files)
  (define-key web-mode-map (kbd "C-c c") 'web-mode-comment-or-uncomment)
  (define-key web-mode-map (kbd "C-i") 'web-mode-buffer-indent))

(defun my/web-mode-hook ()
  "My web mode hook."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2))
(add-hook 'web-mode-hook 'my/web-mode-hook)

;; scss-mode
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(defun my/scss-mode-hook ()
  "Scss-mode-hook."
  (setq css-indent-offset 2)
  (setq scss-compile-at-save nil))

(add-hook 'scss-mode-hook 'my/scss-mode-hook)

;;  emmet-mode
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'rhml-mode-hook 'emmet-mode)
(add-hook 'scss-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)

(with-eval-after-load 'emmet-mode
  (define-key emmet-mode-keymap (kbd "C-j") nil)
  (define-key emmet-mode-keymap (kbd "s-i") 'emmet-expand-line))

(defun my/emmet-mode-hook ()
  "My emmet mode hook."
  (setq emmet-indentation 2)
  (setq emmet-preview-default nil))
(add-hook 'emmet-mode-hook 'my/emmet-mode-hook)

;;; 56_markup-mode.el ends here
