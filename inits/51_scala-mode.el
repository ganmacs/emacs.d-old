;;; 51_scala-mode.el --- scala mode configuration
;;; Commentary:
;;; Code:

(custom-set-faces
 '(ensime-implicit-highlight ((t (:underline nil)))))

(with-eval-after-load 'ensime-mode
  (setq ensime-completion-style 'auto-complete))

(defun my/ensime-mode-hook ()
  "My ensime mode hook."
  (define-key ensime-mode-map (kbd "M-n") 'forward-paragraph)
  (define-key ensime-mode-map (kbd "M-p") 'backward-paragraph)
  (define-key scala-mode-map (kbd ".") 'scala/completing-dot))

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'ensime-mode-hook 'my/ensime-mode-hook)
(add-hook 'ensime-mode-hook #'scala/enable-eldoc)

(defun scala/enable-eldoc ()
  "Show error message or type name at point by Eldoc."
  (setq-local eldoc-documentation-function
              #'(lambda ()
                  (when (ensime-connected-p)
                    (let ((err (ensime-print-errors-at-point)))
                      (or (and err (not (string= err "")) err)
                          (ensime-print-type-at-point))))))
  (eldoc-mode +1))

(defun scala/completing-dot ()
  "Insert a period and show completions."
  (interactive "*")
  (when (s-matches? (rx (+ (not space)))
                    (buffer-substring (line-beginning-position) (point)))
    (delete-horizontal-space t))
  (insert ".")
  (when (and (ensime-connected-p) ensime-completion-style)
    (ac-trigger-key-command t)))

;; 51_scala-mode.el ends here
