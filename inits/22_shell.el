;;; 22_shell.el --- mode configuration
;;; Commentary:
;;; Code:

;; exec-path-from-shell
(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-initialize)

;; shell-switcher
(require 'shell-switcher)
(setq shell-switcher-mode t)
;; eshell
(custom-set-variables
 '(eshell-history-size 1000)
 '(eshell-cmpl-ignore-case t)
 '(eshell-hist-ignoredups t)
 '(eshell-prompt-regexp "^[^#$n]*[#$] ")
 '(eshell-prompt-function 'my/eshell-prompt)
 '(eshell-visual-commands (quote ("vi" "vim" "top" "screen" "lynx"
                                  "ssh" "rlogin" "telnet"
                                  "irb" "coffee" "ghci"))))

(add-hook 'eshell-mode-hook 'my/eshell-mode-hook)
(add-hook 'eshell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-filter-apply)

(defun my/eshell-mode-hook ()
  "My eshell mode hook."
  (setq show-trailing-whitespace nil)
  (linum-mode 0)
  (setq eshell-ask-to-save-history (quote always))
  (setq eshell-path-env (getenv "PATH"))
  (setq comint-scroll-show-maximum-output t) ;; shell-mode
  (define-key eshell-mode-map (kbd "C-a") 'eshell-bol)
  (define-key eshell-mode-map (kbd "C-p") 'eshell-previous-matching-input-from-input)
  (define-key eshell-mode-map (kbd "C-n") 'eshell-next-matching-input-from-input)
  (define-key eshell-mode-map (kbd "C-r") 'helm-eshell-history)
  (define-key eshell-mode-map (kbd "M-c") 'helm-esh-pcomplete)
  (define-key eshell-mode-map (kbd "C-i") 'auto-complete)

  (require 'pcomplete)
  (add-to-list 'ac-modes 'eshell-mode)
  (setq ac-sources '(ac-source-pcomplete
                     ac-source-words-in-buffer
                     ac-source-dictionary)))

(defun my/eshell-prompt ()
  "Prompt."
  (concat
   (propertize (abbreviate-file-name (eshell/pwd))
               'face '(:foreground "#ad7fa8")
               'read-only t)
   (propertize "\n$ "
               'face '(:foreground "#edd400")
               'read-only t
               'rear-nonsticky '(face read-only))))

(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun pcomplete/sudo ()
  "Completion rules for the `sudo' command."
  (let ((pcomplete-help "complete after sudo"))
    (pcomplete-here (pcomplete-here (eshell-complete-commands-list)))))

;;; 22_shell.el ends here
