;;; 13_auto-complete.el --- auto complete configuration
;;; Commentary:
;;; Code:

(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(custom-set-variables
 '(ac-use-fuzzy t)
 '(ac-dwim t)
 '(ac-use-menu-map t)
 '(ac-ignore-case nil))

(let ((bgc "#333") (color "#729fcf"))
  ;; complete menu
  (set-face-foreground 'ac-candidate-face color)
  (set-face-background 'ac-candidate-face bgc)

  ;; selected complate menu
  (set-face-foreground 'ac-selection-face "white")
  (set-face-background 'ac-selection-face "#729fcf")

  (set-face-foreground 'popup-summary-face color)
  (set-face-background 'popup-summary-face bgc)

  ;; document with auto complete menu
  (set-face-background 'popup-tip-face "#555")
  (set-face-foreground 'popup-tip-face "#eee"))

(setq ac-comphist-file (concat user-emacs-directory "log/ac-comphist.dat"))
(add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/etc/ac-dict"))
(add-to-list 'ac-sources 'ac-source-yasnippet)

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)

(append-to-list 'ac-modes
                html-mode
                haml-mode
                eshell-mode
                cider-mode
                markdown-mode)


;;; 13_auto-complete.el ends here
