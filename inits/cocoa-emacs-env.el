;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; for global ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; キーの設定
(setq ns-right-command-modifier (quote hyper))
(setq ns-right-option-modifier (quote alt))

(require 'ucs-normalize)
;; Macの場合ファイル名はutf-8-hfs
;;(setq file-name-coding-system 'utf-8)
;;(setq locale-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)

;; 英語font
(set-face-attribute 'default nil
                    :family "Menlo" ;; font
                    :height 130)    ;; font size
;; 日本語font
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Maru Gothic ProN")) ;; font

;; 半角と全角の比を1:2に
(setq face-font-rescale-alist
      '((".*Hiragino_Maru_Gothic_ProN.*" . 1.0)))

;;ファイルをドラッグ&ドロップした時新しいウインドウを開かない
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; for input ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq default-input-method "MacOSX")
(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

;; カーソルの色
(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `cursor-color "red")
(mac-set-input-method-parameter "com.google.inputmethod.Japanese.Roman" `cursor-color "#fce94f")

;; emacs 起動時は英数モードから始める
(add-hook 'after-init-hook 'mac-change-language-to-us)

;; minibuffer 内は英数モードにする
(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

;; [migemo]isearch のとき IME を英数モードにする
(add-hook 'isearch-mode-hook 'mac-change-language-to-us)

;; focus したら半角
(add-hook 'focus-in-hook 'mac-change-language-to-us)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; for misc ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ispellの辞書
(setq ispell-program-name "/usr/local/bin/aspell")
