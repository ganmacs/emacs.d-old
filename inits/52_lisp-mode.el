;; ------ elisp

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; ------ clojure

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(with-eval-after-load 'cider-mode
  (setq nrepl-hide-special-buffers t)
  (setq cider-repl-wrap-history t)
  (setq cider-repl-history-file "~/.emacs.d/log/cider-hist")
  (setq cider-popup-stacktraces nil)      ;popupしない
  (setq cider-auto-select-error-buffer nil)
  (setq nrepl-buffer-name-show-port t))

;; ------ scheme
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(add-to-list 'process-coding-system-alist '("gosh" utf-8 . utf-8))
(setq scheme-program-name "/usr/local/bin/gosh -i")

(defun scheme-other-windows ()
  (interactive)
  (save-selected-window
    (select-window (split-window-horizontally))
    (run-scheme scheme-program-name)))

(define-key global-map "\C-cG" 'scheme-other-windows)
