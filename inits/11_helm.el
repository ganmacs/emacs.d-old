;;; 11_helm.el --- helm configuration
;;; Commentary:
;;; Code:

;; helm
(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "C-M-z") 'helm-resume)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-i") 'helm-imenu)
(global-set-key (kbd "C-x C-h j") 'helm-c-apropos)

(with-eval-after-load 'helm-mode
  (defvar helm-map)
  (define-key helm-map (kbd "C-h") 'delete-backward-char))

(custom-set-variables
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-auto-update-initial-value nil))

;; swoop
(global-set-key (kbd "M-o") 'helm-swoop)
(global-set-key (kbd "M-O") 'helm-swoop-back-to-last-point)
(define-key isearch-mode-map (kbd "C-o") 'helm-swoop-from-isearch)

(custom-set-variables
 '(helm-multi-swoop-edit-save nil)
 '(helm-swoop-split-with-multiple-windows nil)
 '(helm-swoop-split-direction 'split-window-vertically)
 '(helm-swoop-speed-or-color nil))

;; ag
(global-set-key (kbd "M-g .") 'helm-ag)                     ;; ag
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)           ;; ag

(custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-thing-at-point 'symbol))

;; git-grep
(require 'emacs-git-grep)
(global-set-key (kbd "M-g g") 'emacs-git-grep)

;; helm-ls-git
(global-set-key (kbd "s-l") 'helm-ls-git-ls)

;; helm-ghq
(global-set-key (kbd "C-M-;") 'helm-ghq)

(require 'recentf-ext)
;;; 11_helm.el ends here
