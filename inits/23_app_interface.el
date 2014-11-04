;; -------------------- google translate ------------------

(global-set-key (kbd "s-t") 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '(("en" . "ja") ("ja" . "en")))

;; -------------------- dash-at-point ------------------

(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key (kbd "s-D") 'dash-at-point)
