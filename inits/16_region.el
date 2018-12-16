;;; 16_region.el --- region configuration
;;; Commentary:
;;; Code:

;; expand-region
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

;; multiple-cursor
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

(setq mc/list-file "~/.emacs.d/log/.mc-lists.el")

;;; 16_region.el ends here
