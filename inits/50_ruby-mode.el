;;; 50_ruby-mode.el --- mode configuration
;;; Commentary:
;;; Code:

(defun my/ruby-mode-hook ()
  "My ruby mode hook."
  (util/append-to-list
   'auto-mode-alist '(("Gemfile" . ruby-mode)
                      ("\\.thor$" . ruby-mode)
                      ("\\.rake$" . ruby-mode)
                      ("Guardfile$" . ruby-mode)
                      ("\\.env$" . ruby-mode)
                      ("\\.cap$" . ruby-mode)))
  (setq ruby-insert-encoding-magic-comment nil))

(add-hook 'ruby-mode-hook 'my/ruby-mode-hook)

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; rhtml
(util/append-to-list
 'auto-mode-alist '(("\\.eco$" . rhtml-mode)
                    ("\\.jeco$" . rhtml-mode)
                    ("\\.erb$" . rhtml-mode)))

;;; 50_ruby-mode.el ends here
