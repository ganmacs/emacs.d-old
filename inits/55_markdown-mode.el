;;; 55_markdown-mode.el --- markdown mode configuration
;;; Commentary:
;;; Code:

(defun marked-preview-file ()
  "Open Marked.app ."
  (interactive)
  (shell-command
   (format "open -a Marked\\ 2.app %s"
           (shell-quote-argument (buffer-file-name)))))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "M-p") nil)
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "C-c C-c o") 'marked-preview-file))

;; githubflavar-mode用
(defadvice delete-trailing-whitespace (around disable-in-markdown activate)
  (unless (eq major-mode 'markdown-mode)
    ad-do-it))

;;; 55_markdown-mode.el ends here
