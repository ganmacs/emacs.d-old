;;; 00_util.el --- utility functions and macros for my emacs configurations
;;; Commentary:
;;; Code:

(defmacro append-to-list (mode-list &rest body)
  "add-to-listに複数指定する"
  (let ((lst (cl-gensym)))
    `(dolist (,lst ',body)
       (add-to-list ,mode-list ,lst))))

(defmacro add-hook-lambda (hook &rest body)
  "add-hookのlambdaをなくす"
  `(add-hook ,hook (lambda () ,@body)))

(defmacro global-set-key-lambda (keybind &rest body)
  "gobal-set-keyに関数を渡すときlambdaをなくす"
  `(global-set-key ,keybind '(lambda () (interactive) ,@body)))

(defun util/chomp (str)
  "STR should string."
  (replace-regexp-in-string "[\n\r]" "" str))

(defun util/git-project? ()
  "Check git project or not."
  (let ((cmd "git rev-parse --is-inside-work-tree"))
    (string= "true"
             (util/chomp (shell-command-to-string cmd)))))

(defun util/git-directory ()
  "Return git repository full path."
  (let ((cmd "git rev-parse --show-toplevel"))
    (if (util/git-project?)
        (format "%s/" (util/chomp (shell-command-to-string cmd))))))

(defsubst util/marked-string ()
  "Return marked string."
  (when (use-region-p)
    (buffer-substring-no-properties (region-beginning) (region-end))))

(defun util/same-ext? (file-path ext)
  "Check same exntion or not."
  (let ((file-ext (file-name-extension file-path)))
    (if file-ext
        (string= (downcase file-ext) ext))))

;; for osx utility functions

(defun util/execute-on-iterm (command)
  "COMMAND should string."
  (interactive "MCommand: ")
  (do-applescript
   (format "tell application \"iTerm\"
              activate
              tell current session of current terminal
                write text \"%s\"
              end tell
            end tell"
           command)))



;;; 00_util.el ends here
