;;; 01_basic_setting.el --- basic configuration
;;; Commentary:
;;; Code:

(require 'cl-lib)

;; For Japanese
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-by-copying t)

(global-auto-revert-mode 1)

;; Allow narrowing mode
(put 'narrow-to-region 'disabled nil)

(setq make-backup-files t)

(custom-set-variables
 '(recentf-auto-cleanup 10)
 '(recentf-max-menu-items 10)
 '(recentf-max-saved-items 2000)
 '(recentf-exclude '(".emacs.d/recentf" ".emacs.d/log"))
 '(recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list)))
(recentf-mode t)

(custom-set-variables
 '(history-length 500)
 '(history-delete-duplicates t)
 '(savehist-file "~/.emacs.d/log/history"))
(savehist-mode 1)

(custom-set-variables
 '(delete-auto-save-files t)
 '(auto-save-timeout 600)               ; Default=30sec
 '(auto-save-list-file-prefix "~/.emacs.d/log/auto-save-list/.saves-")
 '(auto-save-file-name-transforms `((".*" ,(expand-file-name "~/.emacs.d/log/backup/") t)))
 '(backup-directory-alist (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/log/backup"))
                                backup-directory-alist)))

;; Make mode line flat
(set-face-attribute 'mode-line          nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(custom-set-variables
 '(cua-enable-cua-keys nil))
(cua-mode t)

;; Coding
(custom-set-variables
 '(undo-limit 100000)
 '(undo-strong-limit 130000)
 '(kill-whole-line t) ; Delete whole line when cursor is at begining of line
 '(require-final-newline nil)
 '(indent-tabs-mode nil)                ; Use space instead of tab
 '(tab-width 2))

;; Looks
(custom-set-variables
 '(column-number-mode t)
 '(transient-mark-mode t)
 '(display-time-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "") ; Remove messages in intial scratch buffer
 '(ring-bell-function 'ignore)
 )

;; trailing white space
(set-face-background 'trailing-whitespace "#b14770")
(custom-set-variables '(show-trailing-whitespace t))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; show EOF
(custom-set-variables
 '(indicate-empty-lines t)
 '(indicate-buffer-boundaries 'right))

(set-cursor-color "#fce94f")
(custom-set-variables
 '(blink-cursor-interval 0.5)
 '(blink-cursor-delay 300.0))           ; 5 minitus
(blink-cursor-mode 1)

(global-hl-line-mode t)
(custom-set-faces
 '(hl-line ((t (:background "#151515")))))

;; Display line number
(global-linum-mode t)

;; ウィンドウの透明化
(add-to-list 'default-frame-alist '(alpha . (90 60)))

(setq frame-title-format "%f")          ; %f is fullpath

;; 括弧の範囲内を強調表示
(custom-set-variables
 '(show-paren-delay 0)
 '(show-paren-style 'expression))
(set-face-background 'show-paren-match-face nil)
(set-face-underline 'show-paren-match-face "#fce94f")
(show-paren-mode t)

;; 1行ずつスクロール
(custom-set-variables
 '(scroll-conservatively 35)
 '(scroll-margin 0)
 '(sescroll-step 1))

;; マウススクロール調整
(mouse-wheel-mode)
(util/global-set-key-lambda [wheel-up] (scroll-down 1))
(util/global-set-key-lambda [wheel-down] (scroll-up 1))
(util/global-set-key-lambda [double-wheel-up] (scroll-down 1))
(util/global-set-key-lambda [double-wheel-down] (scroll-up 1))
(util/global-set-key-lambda [triple-wheel-up] (scroll-down 2))
(util/global-set-key-lambda [triple-wheel-down] (scroll-up 2))

(defface my-face-b-1 '((t (:background "DeepPink"))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("　" 0 my-face-b-1 append))))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(util/add-hook-lambda 'find-file-hooks
                      (if font-lock-mode nil (font-lock-mode t)))

;; for GC
(setq-default gc-cons-threshold (* gc-cons-threshold 10))

;;; 01_basic_setting.el ends here
