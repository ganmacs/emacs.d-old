;;; 18_migemo.el --- migemo mode configuration
;;; Commentary:
;;; Code:

;; (require 'migemo)
;; (custom-set-variables
;;  '(migemo-command "/usr/local/bin/cmigemo")
;;  '(migemo-options '("-q" "--emacs"))
;;  '(migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
;;  '(migemo-user-dictionary nil)
;;  '(migemo-regex-dictionary nil)
;;  '(migemo-coding-system 'utf-8-unix))

;; (load-library "migemo")
;; (migemo-init)

;; do not ask to kill 'migemo' when shut down 'Emacs'
;; (set-process-query-on-exit-flag (get-process "migemo") nil)

;;; 18_migemo.el ends here
