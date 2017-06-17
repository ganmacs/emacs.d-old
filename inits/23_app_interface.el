;;; 23_app_interface.el --- app configuration
;;; Commentary:
;;; Code:

;; google translate
(global-set-key (kbd "s-t") 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '(("en" . "ja") ("ja" . "en")))

;;; 23_app_interface.el ends here
