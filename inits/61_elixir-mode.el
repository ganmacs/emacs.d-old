;;; 61_elixir-mode.el --- elixir mode configuration
;;; Commentary:
;;; Code:

(require 'alchemist)


(with-eval-after-load 'elixir-mode
  (define-key elixir-mode-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "<RET>") 'company-expand-top)
  (define-key company-active-map (kbd "C-m") 'company-expand-top)
  (define-key company-active-map (kbd "<Tab>") 'company-expand-top)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-c") (lambda (x)
                                               (interactive)
                                               (alchemist-company--show-documentation x))))

(defun my-elixir-mode-hook ()
  (company-mode 1)
  (setq company-auto-expand t)
  (setq company-idle-delay nil))
(add-hook 'elixir-mode-hook 'my-elixir-mode-hook)

;;; 61_elixir-mode.el ends here
