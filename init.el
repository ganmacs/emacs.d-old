;;; init.el --- initialize file
;;; Commentary:
;;; Code:

(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

(setq custom-theme-directory "~/.emacs.d/etc/color-theme/")
(load-theme 'tango t)

(require 'init-loader)
(custom-set-variables
 '(setq-default init-loader-byte-compile t))
(init-loader-load)

;;; init.el ends here
