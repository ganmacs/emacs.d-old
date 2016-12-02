;;; 100_helm_ghq.el --- mode configuration
;;; Commentary:
;;; Code:

(require 'helm)
(require 'helm-mode)
(require 'helm-files)

(defun helm-ghq-dired--root ()
  (util/chomp (shell-command-to-string "ghq root")))

(defun helm-ghq-dired-do-open (dircotry)
  (dired (concat (helm-ghq-dired--root) "/" dircotry)))

(defvar helm-ghq-dired--action
  '(("Open" . helm-ghq-dired-do-open)))

(defun helm-ghq-dired--list-directories ()
  (with-current-buffer (helm-candidate-buffer 'global)
    (unless (zerop (call-process "ghq" nil t nil "list"))
      (error "Failed: ghq list"))))

(defun helm-ghq-dired--source ()
  (helm-build-in-buffer-source "ghq list"
    :init #'helm-ghq-dired--list-directories
    :action helm-ghq-dired--action))

(defun helm-ghq-dired ()
  (interactive)
  (helm :sources (helm-ghq-dired--source)
        :buffer "*helm-ghq-dired-list*"))

(global-set-key (kbd "C-M-;") 'helm-ghq-dired)

;;; 100_custom_functions.el ends here
