;;; 51_scala-mode.el --- scala mode configuration
;;; Commentary:
;;; Code:

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(with-eval-after-load 'ensime-mode
  ;; (setq ac-sources (reverse ac-sources))
  (setq ac-dwim t)
  (setq ac-auto-start 4)
  (setq ac-trigger-key (kbd "M-/")))

(defun ensime-mode-hook ()
  "My ensime mode hook."
  (setq ensime-completion-style 'auto-complete)
  (setq ensime-ac-override-settings nil)
  (add-to-list 'ac-sources 'ac-source-abbrev)
  (add-to-list 'ac-sources 'ac-source-dictionary)
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
  (define-key ensime-mode-map (kbd "M-n") 'forward-paragraph)
  (define-key ensime-mode-map (kbd "M-p") 'backward-paragraph))

(add-hook 'ensime-mode-hook 'ensime-mode-hook)

;;; 51_scala-mode.el ends here
