;;; 63_org-mode.el --- rust mode configuration
;;; Commentary:
;;; Code:

(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))

(defun my/rust-mode-hook ()
  "My rust mode."
  (racer-mode)
  (flycheck-rust-setup)
  (rust-enable-format-on-save))
(add-hook 'rust-mode-hook 'my/rust-mode-hook)

(with-eval-after-load 'racer-mode
  (add-to-list 'jumplist-hook-commands 'racer-find-definition)
  (add-to-list 'company-backends 'company-racer))

(defun my/racer-mode-hook ()
  "My racer mode."
  (define-key racer-mode-map (kbd "M-/") 'company-complete))
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook 'my/racer-mode-hook)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;;; 64_rust-mode.el ends here
