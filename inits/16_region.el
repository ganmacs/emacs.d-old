;; ---------- expand-region
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

;; ---------- multiple-cursor
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)

(setq mc/list-file "~/.emacs.d/log/.mc-lists.el")

;; ---------- drag-stuff
(drag-stuff-global-mode t)
(global-set-key (kbd "s-.") 'drag-stuff-right)
(global-set-key (kbd "s-,") 'drag-stuff-left)
