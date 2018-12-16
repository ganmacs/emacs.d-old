;;; 30_anzu.el --- anzu mode configuration
;;; Commentary:
;;; Code:

(global-anzu-mode +1)
(set-face-attribute
 'anzu-mode-line nil :foreground "#fce94f" :weight 'bold)
(custom-set-variables
 '(anzu-search-threshold 1000))

(global-set-key (kbd "C-%") 'anzu-replace-at-cursor-thing)
(global-set-key (kbd "M-%") 'anzu-query-replace-at-cursor)

;;; 30_anzu.el ends here
