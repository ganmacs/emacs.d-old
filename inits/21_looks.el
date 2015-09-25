;;; 21_looks.el --- looks configuration
;;; Commentary:
;;; Code:

;; highlight-indentation
(require 'highlight-indentation)

(util/add-hooks-lambda
 '(ruby-mode-hook
   coffee-mode-hook
   js2-mode-hook
   rhtml-mode-hook
   clojure-mode-hook
   java-mode-hook
   python-mode-hook
   scheme-mode-hook
   haskell-mode-hook
   scala-mode-hook
   tuareg-mode-hook
   go-mode-hook
   slim-mode-hook
   elixir-mode-hook
   c-mode-hook
   cc-mode-hook
   sh-mode-hook)
 (highlight-indentation-current-column-mode))

(set-face-background 'highlight-indentation-current-column-face "#222")

;; ------------- yascroll ----------------------

(global-yascroll-bar-mode 1)
(custom-set-faces
 '(yascroll:thumb-text-area ((t (:background "#777"))))
 '(yascroll:thumb-fringe ((t (:background "#777"))))
 '(yascroll:thumb-fringe ((t (:background "#777" :foreground "#777")))))

;; ------------- idle-highlight-mode ----------------------

(util/add-hooks-lambda
 '(emacs-lisp-mode-hook
   ruby-mode-hook
   js2-mode-hook
   scala2-mode-hook
   scheme-mode-hook
   tuareg-mode-hook
   clojure-mode-hook
   go-mode-hook
   haskell-mode-hook
   elixir-mode-hook
   scala-mode-hook
   c-mode-hook
   cc-mode-hook
   sh-mode-hook)
 (idle-highlight-mode t))

(custom-set-faces
 '(idle-highlight ((t (:underline t)))))

;; ------------- hl-anything ----------------------

(require 'hl-anything)
(hl-highlight-mode 1)
(global-set-key (kbd "C-0") 'hl-highlight-thingatpt-local)
(global-set-key (kbd "M-0") 'hl-unhighlight-all-local)

;; ------------- rainbow-mode ----------------------
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)

;; hlinum
(require 'hlinum)
(hlinum-activate)
(custom-set-faces
 '(linum-highlight-face ((t (:foreground "black"
                                         :background "#fce94f")))))

;; powerline
(require 'powerline)

(defface powerline-active3
  '((t (:background "#462743" :inherit mode-line-inactive
                    :foreground "#eee")))
  "Powerline face 3."
  :group 'powerline)

(defface powerline-inactive3
  '((t (:background "#190E18" :inherit mode-line-inactive
                    :foreground "#222")))
  "Powerline face 3."
  :group 'powerline)

(defface powerline-active4
  '((t (:background "#eee" :inherit mode-line-inactive
                    :foreground "#462743")))
  "Powerline face 4."
  :group 'powerline)

(defface powerline-inactive4
  '((t (:background "#666" :inherit mode-line-inactive
                    :foreground "#190E18")))
  "Powerline face 4."
  :group 'powerline)

(defface powerline-active5
  '((t (:background "#729fcf" :inherit mode-line-inactive
                    :foreground "#222")))
  "Powerline face 5."
  :group 'powerline)

(defface powerline-inactive5
  '((t (:background "#1B3954" :inherit mode-line-inactive
                    :foreground "gray22")))
  "Powerline face 5."
  :group 'powerline)


(defun my-powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (face3 (if active 'powerline-active3 'powerline-inactive3))
                          (face4 (if active 'powerline-active4 'powerline-inactive4))
                          (face5 (if active 'powerline-active5 'powerline-inactive5))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-major-mode face3 'l)
                                     (powerline-raw " " face3)
                                     (funcall separator-left face3 face4)
                                     (powerline-buffer-id face4 'l)
                                     (powerline-narrow face3 'l)
                                     (funcall separator-left face4 face5)
                                     (powerline-raw "%p" face5 'r)
                                     (powerline-narrow face3 'l)
                                     (funcall separator-left face5 face1)
                                     ))
                          (rhs (list (powerline-vc face1 'r)
                                     (funcall separator-right face1 face4)
                                     (powerline-raw "%4l" face4 'l)
                                     (powerline-raw ":" face4 'l)
                                     (powerline-raw "%3c" face4 'r)
                                     (funcall separator-right face4 face3)
                                     (powerline-raw "%Z%*" face3 'l)
                                     (powerline-raw " " face3)
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))
(my-powerline-theme)

;;; 21_looks.el ends here
