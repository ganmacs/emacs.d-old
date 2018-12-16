;;; 11_helm.el --- helm configuration
;;; Commentary:
;;; Code:

;; helm
(use-package helm
  :init (require 'helm)
  :bind (("C-;" . helm-for-files)
	       ("C-M-/" . helm-resume)
	       ("M-x" . helm-M-x)
	       ("M-i" . helm-imenu)
	       ("M-y" . helm-show-kill-ring)
	       ("M-g M-g" . counsel-git-grep)
         :map helm-map
         ("C-h" . delete-backward-char)
         ("C-t" . transpose-chars))
  :config
  (setq
   helm-delete-minibuffer-contents-from-point t
   helm-ff-auto-update-initial-value nil))

(use-package helm-swoop
  :bind (("M-o" . helm-swoop)
         ("M-O" . helm-swoop-back-to-last-point)))

(use-package helm-ls-git
  :bind ("s-l" . helm-ls-git-ls))

;; ag
(global-set-key (kbd "M-g .") 'helm-ag)                     ;; ag
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)           ;; ag

(custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-thing-at-point 'symbol))

;; helm-gtags
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'ruby-mode-hook 'helm-gtags-mode)

(with-eval-after-load "helm-gtags"
  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))

;; git-grep
(global-set-key (kbd "M-g M-g") '(lambda () (interactive)
                                   (if (and mark-active transient-mark-mode)
                                       (helm-git-grep-at-point)
                                     (helm-git-grep))))

(require 'recentf-ext)
;;; 11_helm.el ends here
