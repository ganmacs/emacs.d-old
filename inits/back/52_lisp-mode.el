;;; 52_lisp-mode.el --- lisp mode configuration
;;; Commentary:
;;; Code:

;; elisp
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; Clojure
(defun my/cider-mode-hook ()
  "My Clojure mode."
  (cider-turn-on-eldoc-mode)
  (ac-flyspell-workaround)
  (ac-cider-setup)
  (define-key clojure-mode-map (kbd "C-M-:") 'clojure-toggle-keyword-string)
  (define-key clojure-mode-map (kbd "C-:") nil)
  (define-key clojure-mode-map (kbd "C-c C-d C-c") 'search-word-in-clojure)
  (clj-refactor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(defun search-word-in-clojure ()
  "Search word in alc."
  (interactive)
  (let* ((cmd "open \"%s\"")
         (url (format "https://clojuredocs.org/search?q=%s"
                      (or (util/marked-string) (read-shell-command "word: ")))))
    (shell-command-to-string
     (format cmd url))))

(add-hook 'clojure-mode-hook 'flycheck-mode)
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

;; Scheme
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(add-to-list 'process-coding-system-alist '("gosh" utf-8 . utf-8))
(setq scheme-program-name "/usr/local/bin/gosh -i")

(defun scheme-another-window ()
  "Open sheme interpreter in other window."
  (interactive)
  (save-selected-window
    (select-window (split-window-horizontally))
    (run-scheme scheme-program-name)))

(define-key global-map "\C-cG" 'scheme-another-window)

;;; 52_lisp-mode.el ends here
