;;; 23_app_interface.el --- app configuration
;;; Commentary:
;;; Code:

;; for google translate
(global-set-key (kbd "s-t") 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '(("en" . "ja") ("ja" . "en")))

;; for dash-at-point
(global-set-key (kbd "s-D") 'dash-at-point)

;;; 23_app_interface.el ends here
