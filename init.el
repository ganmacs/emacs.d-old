(unless load-file-name (cd (getenv "HOME")))

(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

(setq custom-theme-directory "~/.emacs.d/etc/color-theme/")
(load-theme 'tango t)

;; init-loader
(require 'init-loader)
;; (custom-set-variables
;;  '(init-loader-show-log-after-init nil))
(init-loader-load)
