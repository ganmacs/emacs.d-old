;;; 11_helm.el --- helm configuration
;;; Commentary:
;;; Code:

(require 'helm-config)
(require 'helm-files)

(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "C-M-z") 'helm-resume)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-i") 'helm-imenu)
(global-set-key (kbd "C-x C-h j") 'helm-c-apropos)

;; C-h でバックスペースと同じように文字を削除できるようにする
(define-key helm-map (kbd "C-h") 'delete-backward-char)

;; ミニバッファで C-k 入力時にカーソル以降を削除する（C-u C-k でも同様の動きをする）
(setq helm-delete-minibuffer-contents-from-point t)

;; 自動補完を無効にする
(setq helm-ff-auto-update-initial-value nil)


;; helm-ag
(require 'helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-command-option "--all-text")
(setq helm-ag-thing-at-point 'symbol)
(global-set-key (kbd "M-g .") 'helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)

;; emacs-git-grep
(require 'emacs-git-grep)
(global-set-key (kbd "M-g g") 'emacs-git-grep)

;; helm-swoop

(require 'helm-swoop)
(global-set-key (kbd "M-o") 'helm-swoop)
(global-set-key (kbd "M-O") 'helm-swoop-back-to-last-point)

;; isearch実行中にhelm-swoopに移行
(define-key isearch-mode-map (kbd "C-o") 'helm-swoop-from-isearch)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save nil)

;; 値がtの場合はウィンドウ内に分割、nilなら別のウィンドウを使用
(setq helm-swoop-split-with-multiple-windows nil)

;; ウィンドウ分割方向 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; nilなら一覧のテキストカラーを失う代わりに、起動スピードをほんの少し上げる
(setq helm-swoop-speed-or-color nil)


;; helm-ls-git
(require 'helm-ls-git)
(global-set-key (kbd "s-l") 'helm-ls-git-ls)

;; helm-ghq

(global-set-key (kbd "C-M-;") 'helm-ghq)


;; recentf

(require 'recentf-ext)
(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".emacs.d/recentf" ".emacs.d/log"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)

;;; 11_helm.el ends here
