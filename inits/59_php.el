;;; 59_php.el --- php mode configuration
;;; Commentary:
;;; Code:

(with-eval-after-load 'php-mode
  (define-key php-mode-map (kbd "C-.") 'other-window)
  (define-key php-mode-map (kbd "M-j") 'duplicate-thing)
  (key-chord-define php-mode-map ";;"  "\C-e;")
  (key-chord-define php-mode-map "FF"  "->"))

(defun my/php-mode-hook ()
  "My php mode hook."
  (c-set-offset 'case-label' 4)
  (c-set-offset 'arglist-intro' 4)
  (c-set-offset 'arglist-cont-nonempty' 4)
  (c-set-offset 'arglist-close' 0))
(add-hook 'php-mode-hook 'my/php-mode-hook)


;;; 59_php.el ends here
