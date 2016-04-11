;;; 63_org-mode.el --- rust mode configuration
;;; Commentary:
;;; Code:

(setq racer-rust-src-path "/Users/ganmacs/.rust/src/")
(setq racer-cmd "/Users/ganmacs/.cargo/bin/racer")

(with-eval-after-load 'racer-mode
  (add-to-list 'company-backends 'company-racer))

(defun rust/insert-semicoron ()
  (interactive)
  (save-excursion
    (move-end-of-line 1)
    (insert ";")))

(defun my/racer-mode-hook ()
  "My racer mode."
  (define-key racer-mode-map (kbd "M-/") 'company-complete)
  (define-key racer-mode-map (kbd "s-i") 'rust/insert-semicoron))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook 'my/racer-mode-hook)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;;; 64_rust-mode.el ends here
