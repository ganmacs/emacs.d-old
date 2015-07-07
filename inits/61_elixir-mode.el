(require 'alchemist)
(defun my-elixir-mode-hook ()
  (company-mode 1)
  (define-key company-active-map (kbd "<RET>") 'company-expand-top)
  (define-key company-active-map (kbd "C-m") 'company-expand-top)
  (define-key company-active-map (kbd "<Tab>") 'company-expand-top)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-c") (lambda (x)
                                               (interactive)
                                               (alchemist-company--show-documentation x)))
  (define-key elixir-mode-map (kbd "M-/") 'company-complete)
  ;; 1個目を自動的に補完
  (setq company-auto-expand t)
  ;; 複数補完を出す前に待つ秒数？
  (setq company-idle-delay nil)
  )

(add-hook 'elixir-mode-hook 'my-elixir-mode-hook)
