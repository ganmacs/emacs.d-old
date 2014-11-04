(require 'recentf-ext)
(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".emacs.d/recentf" ".emacs.d/log"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)
