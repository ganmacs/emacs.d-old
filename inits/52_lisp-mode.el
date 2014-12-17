;; ------ elisp

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; ------ clojure

(defun my/cider-mode-hook ()
  (cider-turn-on-eldoc-mode)
  (ac-flyspell-workaround)
  (ac-cider-setup)
  (define-key clojure-mode-map (kbd "C-M-;") 'clojure-toggle-keyword-string)
  (define-key clojure-mode-map (kbd "C-:") nil)
  )
  ;; (rainbow-delimiters-mode))

(add-hook 'cider-mode-hook 'my/cider-mode-hook)

(with-eval-after-load 'cider-mode
  (setq nrepl-log-message t)
  (setq nrepl-hide-special-buffers t)
  (setq cider-repl-wrap-history t)
  (setq cider-repl-history-file "~/.emacs.d/log/cider-hist")
  (setq cider-popup-stacktraces nil)      ;popupしない
  (setq cider-show-error-buffer t)
  (setq cider-auto-select-error-buffer nil)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq nrepl-buffer-name-show-port t)
  (setq cider-repl-result-prefix ";; => "))


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
