;; -------------- exec-path-from-shell -----------------------
(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-initialize)

;; -------------- shell-switcher ---------------------
(autoload 'eshell "eshell" nil t)
(require 'shell-switcher)
(setq shell-switcher-mode t)
(setq eshell-path-env (getenv "PATH"))

(defun my-eshell-mode-hook ()
  (define-key eshell-mode-map "\C-p" 'eshell-previous-matching-input-from-input)
  (define-key eshell-mode-map "\C-n" 'eshell-next-matching-input-from-input)
  (define-key eshell-mode-map (kbd "C-r") 'helm-eshell-history)
  (define-key eshell-mode-map (kbd "M-c") 'helm-esh-pcomplete)
  (define-key eshell-mode-map (kbd "C-i") 'auto-complete))

(add-hook 'eshell-mode-hook 'my-eshell-mode-hook)

(with-eval-after-load "eshell"
  ;; (setq ac-sources '(ac-source-complete ac-source-dictionary))
  ;; 補完時に大文字小文字を区別しない
  (setq eshell-cmpl-ignore-case t)
  ;; 確認なしでヒストリ保存
  (setq eshell-ask-to-save-history (quote always))
  ;; 履歴で重複を無視する
  (setq eshell-hist-ignoredups t)

  (add-hook 'eshell-preoutput-filter-functions
            'ansi-color-filter-apply)

  ;; プロンプトの表示変更
  (defun my-eshell-prompt () (concat (eshell/pwd) "\n$ " ))
  (setq eshell-prompt-function 'my-eshell-prompt)
  (setq eshell-prompt-regexp "^[^#$n]*[#$] ")

  ;; ;; sudoに続くコマンドの変換
  ;; (defun pcomplete/sudo ()always
  ;;        "Completion rules for the `sudo' command."
  ;;        (let ((pcomplete-help "complete after sudo"))
  ;;          (pcomplete-here (pcomplete-here (eshell-complete-commands-list)))))

  ;; eshell/clear
  (defun eshell/clear ()
    "Clear the current buffer, leaving one prompt at the top."
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)))

  ;; eshell での補完に auto-complete.el を使う
  ;; (require 'pcomplete)
  ;; (add-to-list 'ac-modes 'eshell-mode)
  ;; (ac-define-source pcomplete
  ;;   '((candidates . pcomplete-completions)))
  )


(custom-set-variables
 ;; '(eshell-history-size 1000)
 ;; '(eshell-ls-dired-initial-args (quote ("-h")))
 ;; '(eshell-ls-exclude-regexp "~\\'")
 ;; '(eshell-ls-initial-args "-h")
 ;; '(eshell-ls-use-in-dired t nil (em-ls))
 ;; '(eshell-modules-list (quote (eshell-alias eshell-basic
 ;;                                            eshell-cmpl eshell-dirs eshell-glob
 ;;                                            eshell-hist eshell-ls eshell-pred
 ;;                                            eshell-prompt eshell-rebind
 ;;                                            eshell-script eshell-smart
 ;;                                            eshell-term eshell-unix eshell-xtra)))
 ;; '(eshell-prefer-to-shell t nil (eshell))
 ;; '(eshell-stringify-t nil)
 ;; '(eshell-term-name "ansi")
 '(eshell-visual-commands (quote ("vi" "vim" "top" "screen" "lynx"
                                  "ssh" "rlogin" "telnet"
                                  "irb" "coffee" "ghci"))))
