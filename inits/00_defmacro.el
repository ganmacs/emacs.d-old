;; add-to-listに複数指定する
(defmacro append-to-list (mode-list &rest body)
  (let ((lst (cl-gensym)))
    `(dolist (,lst ',body)
       (add-to-list ,mode-list ,lst))))

;; add-hookのlambdaをなくす
(defmacro add-hook-lambda (hook &rest body)
  `(add-hook ,hook (lambda () ,@body)))

;; gobal-set-keyに関数を渡すときlambdaをなくす
(defmacro global-set-key-lambda (keybind &rest body)
  `(global-set-key ,keybind '(lambda () (interactive) ,@body)))
