;;; 61_elixir-mode.el --- elixir mode configuration
;;; Commentary:
;;; Code:

(require 'alchemist)


(with-eval-after-load 'elixir-mode
  (define-key elixir-mode-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "C-c") (lambda (x)
                                               (interactive)
                                               (alchemist-company--show-documentation x))))
(add-hook 'elixir-mode-hook #'company-mode)

;;; 61_elixir-mode.el ends here
