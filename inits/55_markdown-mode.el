(require 'markdown-mode)

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "M-p") nil)
  (define-key markdown-mode-map (kbd "M-n") nil))

;; githubflavar-mode用
(defadvice delete-trailing-whitespace (around disable-in-markdown activate)
  (unless (eq major-mode 'markdown-mode)
    ad-do-it))

(defun marked-preview-file ()
  (interactive)
  (shell-command
   (format "open -a Marked\\ 2.app %s"
           (shell-quote-argument (buffer-file-name)))))
(define-key markdown-mode-map (kbd "C-c C-c o") 'marked-preview-file)
