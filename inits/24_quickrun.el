;;; 24_quickrun.el --- quickrrun configuration
;;; Commentary:
;;; Code:

(defun quickrun-sc (start end)
  (interactive "r")
  (if mark-active
      (quickrun :start start :end end)
    (quickrun)))

(global-set-key (kbd "s-R") 'quickrun-sc)

;;; 24_quickrun.el ends here
