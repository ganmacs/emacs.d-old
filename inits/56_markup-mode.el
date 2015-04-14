;; ------- web-mode ---------
(add-to-list 'auto-mode-alist '("\\.html$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . web-mode))

(defun web-mode-hook ()
  (define-key web-mode-map (kbd "C-;") 'helm-for-files)
  (define-key web-mode-map (kbd "C-c c") 'web-mode-comment-or-uncomment)
  (define-key web-mode-map (kbd "C-i") 'web-mode-buffer-indent)
  )

(add-hook 'web-mode-hook 'web-mode-hook)

(custom-set-faces
 '(web-mode-html-tag-bracket-face
   ((t (:foreground "#edd400" :weight bold)))) ; カッコ
 '(web-mode-html-tag-face
   ((t (:foreground "#edd400" :weight bold)))) ; 要素名
 '(web-mode-symbol-face
   ((t (:foreground "#FF7400"))))
 ;; '(web-mode-doctype-face
 ;;    ((t (:foreground "#82AE46"))))                          ; doctype
 ;; '(web-mode-html-attr-name-face
 ;;   ((t (:foreground "#C97586"))))                          ; 属性名など
 ;; '(web-mode-html-attr-value-face
 ;;   ((t (:foreground "#82AE46") )))                          ; 属性値
 ;; '(web-mode-comment-face
 ;;   ((t (:foreground "#D9333F"))))                          ; コメント
 ;; '(web-mode-server-comment-face
 ;;   ((t (:foreground "#D9333F"))))                          ; コメント
 ;; '(web-mode-css-rule-face
 ;;     ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 ;; '(web-mode-css-pseudo-class-face
 ;;  ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 ;; '(web-mode-css-at-rule-face
 ;;   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
 )

(with-eval-after-load 'web-mode
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  )

;; ------- scss-mode ---------
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(with-eval-after-load 'scss-mode
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)))

;; ------- emmet-mode --------
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'rhml-mode-hook 'emmet-mode)
(add-hook 'scss-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)

(defun my-emmet-hook ()
  (define-key emmet-mode-keymap (kbd "C-j") nil)
  (define-key emmet-mode-keymap (kbd "s-i") 'emmet-expand-line))

(with-eval-after-load 'emmet-mode
  (setq emmet-indentation 2)
  (setq emmet-preview-default nil))

(add-hook 'emmet-mode-hook 'my-emmet-hook)
