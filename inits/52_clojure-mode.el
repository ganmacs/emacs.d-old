(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(with-eval-after-load 'cider-mode
  (setq nrepl-hide-special-buffers t)
  (setq cider-repl-wrap-history t)
  (setq cider-repl-history-file "~/.emacs.d/log/cider-hist")
  (setq cider-popup-stacktraces nil)      ;popupしない
  (setq cider-auto-select-error-buffer nil)
  (setq nrepl-buffer-name-show-port t))
