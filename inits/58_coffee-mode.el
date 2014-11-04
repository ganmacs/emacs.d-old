(defun coffee-custom ()
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2)))

(add-hook-lambda 'coffee-mode-hook
                 (coffee-custom))
