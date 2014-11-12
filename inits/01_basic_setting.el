(require 'cl-lib)

;; 環境変数
(setenv "LANG" "ja_JP.UTF-8")

;; ホームディレクトリに移動
(provide 'settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @general ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 環境変数
(setenv "LANG" "ja_JP.UTF-8")

;; 日本語設定
(set-language-environment 'Japanese)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

;; コンパイルし忘れないように

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 終了時にオートセーブファイル（#filename#）を消す
(setq delete-auto-save-files t)

;; オートセーブ間隔 :Default=30sec
(setq auto-save-timeout 600)

;; 元ファイルをバックアップファイルにコピーしてから、新たな内容で上書きする
;; つまり、ファイルの所有者とグループは変わらない
;; デフォルトでは、元ファイルを改名してバックアップとして保存し、新たな内容の新たなファイルを作成する
(setq backup-by-copying t)

;; 最近使ったファイルをメニューに表示
(recentf-mode t)

;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近開いたファイルの保存数を増やす
(setq recentf-max-saved-items 500)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 500)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;;保存時に行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ナローイング許可
(put 'narrow-to-region 'disabled nil)


;; -----------------------------
;; -------- save file ----------
;; -----------------------------

;; バックアップファイル（filename~）とオートセーブファイル（#filename#）は~/.emacs.d/backup/に保存
;; 下記コマンドを crontab -e で記述
;; 0 1 * * * find ~/.emacs.d/backup -mtime +30 -exec rm -f {} \;
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/log/backup/") t)))
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/log/backup"))
            backup-directory-alist))

;; file-path
(setq auto-save-list-file-prefix "~/.emacs.d/log/auto-save-list/.saves-")

;; savehist
(setq savehist-file "~/.emacs.d/log/history")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @BasicTypingRules ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Undo回数制限
(setq undo-limit 100000)
(setq undo-strong-limit 130000)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; 最終行に必ず一行挿入する
(setq require-final-newline nil)

;; tab ではなくスペース を使う
(setq-default indent-tabs-mode nil)

;; tab 幅を 2 に設定
(setq-default tab-width 2)

;; C-Ret で矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @Looks ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; モードラインフラット化
(set-face-attribute 'mode-line          nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;ヒープ音をけす
(setq ring-bell-function 'ignore)

;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; EOB を表示
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such in-tance.
 ;; If there is more than one, they won't work right.
 ;;  '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

;; 5分触らないと点滅しだす
(set-cursor-color "#fce94f")
(setq blink-cursor-interval 0.5)
(setq blink-cursor-delay 300.0)
(blink-cursor-mode 1)

;; 現在行を目立たせる
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "#151515"))
    (((class color)
      (background light))
     (:background "#aaa"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode 1)

;; 行番号表示
(global-linum-mode t)

;; ウィンドウの透明化
(add-to-list 'default-frame-alist '(alpha . (90 60)))

;; 行間
(setq-default line-spauing 0)

;; マーク領域を色付け
(setq transient-mark-mode t)

;; タイトルバーにフルパス表示
(setq frame-title-format (format "%%f" (system-name)))

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "#fce94f")

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode

;; マウススクロール調整
(mouse-wheel-mode)
(global-set-key-lambda [wheel-up] (scroll-down 1))
(global-set-key-lambda [wheel-down] (scroll-up 1))
(global-set-key-lambda [double-wheel-up] (scroll-down 1))
(global-set-key-lambda [double-wheel-down] (scroll-up 1))
(global-set-key-lambda [triple-wheel-up] (scroll-down 2))
(global-set-key-lambda [triple-wheel-down] (scroll-up 2))

(defface my-face-b-1 '((t (:background "DeepPink"))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("　" 0 my-face-b-1 append))))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook-lambda 'find-file-hooks
                 (if font-lock-mode nil (font-lock-mode t)))
