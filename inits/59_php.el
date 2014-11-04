(defun my-php-mode-hook ()
  (define-key php-mode-map (kbd "C-.") 'other-window)
  (define-key php-mode-map (kbd "M-j") 'duplicate-thing)
  (key-chord-define php-mode-map ";;"  "\C-e;")
  (key-chord-define php-mode-map "FF"  "->"))

(with-eval-after-load 'php-mode
  (c-set-offset 'case-label' 4)
  (c-set-offset 'arglist-intro' 4)
  (c-set-offset 'arglist-cont-nonempty' 4)
 (c-set-offset 'arglist-close' 0))
