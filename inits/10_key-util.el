;;; 10_key-util.el --- key utility
;;; Commentary:
;;; Code:

(editorconfig-mode 1)

;; smartrep
(require 'smartrep)
(global-unset-key (kbd "C-:"))
(smartrep-define-key global-map "C-:"
  '(("t" . 'rotate-window)
    ("T" . 'rotate-layout)
    ("h" . (shrink-window-horizontally 1))
    ("j" . (shrink-window -1))
    ("k" . (shrink-window 1))
    ("l" . (shrink-window-horizontally -1))
    ("<left>" . (shrink-window-horizontally 1))
    ("<right>" . (shrink-window-horizontally -1))
    ("<up>" . (shrink-window -1))
    ("<down>" . (shrink-window 1))))

;; emacs-surrround
(require 'emacs-surround)
(global-set-key (kbd "s-w") 'emacs-surround)
(add-to-list 'emacs-surround-alist '("}" . ("{ " . " }")))

;;; 10_key-util.el ends here
