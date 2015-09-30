;;; 24_quickrun.el --- quickrrun configuration
;;; Commentary:
;;; Code:

(defun my/quickrun ()
  "Exec quickrun."
  (interactive)
  (if (use-region-p)
      (quickrun-region (region-beginning)  (region-end))
    (quickrun)))

(global-set-key (kbd "s-R") 'my/quickrun)

;;; 24_quickrun.el ends here
