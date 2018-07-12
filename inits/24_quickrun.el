;;; 24_quickrun.el --- quickrrun configuration
;;; Commentary:
;;; Code:

(defun my/quickrun ()
  "Exec quickrun."
  (interactive)
  (if (use-region-p)
      (quickrun-region (region-beginning)  (region-end))
    (quickrun)))

(quickrun-add-command "c++/clang++"
  '((:exec . ("%c -std=c++11 %o -o %e %s" "%e %a")))
  :override t)

(global-set-key (kbd "s-R") 'my/quickrun)

;;; 24_quickrun.el ends here
