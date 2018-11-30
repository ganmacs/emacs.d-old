;;; 51_scala-mode.el --- scala mode configuration
;;; Commentary:
;;; Code:

(custom-set-faces
 '(ensime-implicit-highlight ((t (:underline nil)))))

;; (with-eval-after-load 'ensime
;;   (setq ensime-startup-snapshot-notification nil)
;;   )

(with-eval-after-load 'ensime-mode
  (setq ensime-completion-style 'auto-complete))

(defun my/ensime-mode-hook ()
  "My ensime mode hook."
  (define-key ensime-mode-map (kbd "M-n") 'forward-paragraph)
  (define-key ensime-mode-map (kbd "M-p") 'backward-paragraph)
  (scala/enable-eldoc))

(defun scala/enable-eldoc ()
  "Show error message or type name at point by Eldoc."
  (setq-local eldoc-documentation-function
              #'(lambda ()
                  (when (ensime-connected-p)
                    (let ((err (ensime-print-errors-at-point)))
                      (or (and err (not (string= err "")) err)
                          (ensime-print-type-at-point))))))
  (eldoc-mode +1))

(add-hook 'ensime-mode-hook 'my/ensime-mode-hook)

;;; 51_scala-mode.el ends here
