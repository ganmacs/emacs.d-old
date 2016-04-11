;;; 63_org-mode.el --- org mode configuration
;;; Commentary:
;;; Code:

(require 'ox-latex)
(with-eval-after-load 'ox-latex
  (setq org-latex-pdf-process '("ptex2pdf -l -ot '-synctex=1 -shell-escape' %f"))
  (setq org-latex-default-class "jsarticle")
  (add-to-list 'org-latex-classes
               '("jsarticle" "\\documentclass{jsarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(custom-set-variables
 '(org-directory "~/Dropbox/org")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-startup-folded nil)
 '(org-return-follows-link t)
 '(org-log-done 'time)
 '(org-agenda-files (list org-directory))
 '(org-capture-templates
   '(("t" "Task" entry (file (expand-file-name (concat org-directory "/task.org")))
      "* TODO %?\n    %i\n   %a\n    %T")
     ("n" "note" entry (file (expand-file-name (concat org-directory "/notes.org")))
      "* %?\n   %a\n    %T")
     ("r" "reading" entry (file (expand-file-name (concat org-directory "/reading.org")))
      "* %?\n   %a\n    %T"))))

(defun my/org-mode-hook ()
  "My org mode hook."
  (define-key org-mode-map (kbd "C-j") 'dabbrev-expand)
  (define-key org-mode-map (kbd "M-h") 'backward-kill-word)
  (define-key org-mode-map (kbd "C-,") 'undo-tree-redo)
  (define-key org-mode-map (kbd "s-S-r") 'org-latex-export-to-pdf))
(add-hook 'org-mode-hook 'my/org-mode-hook)

(global-set-key (kbd "C-c C-q") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

(defun org/note-right-now (content)
  (interactive "sContent: ")
  (org-capture nil "n")
  (insert content)
  (org-capture-finalize))
(global-set-key (kbd "C-M-=") 'org/note-right-now)

;;; 63_org-mode.el ends here
