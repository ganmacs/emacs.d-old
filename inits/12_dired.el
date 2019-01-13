;;; 12_dired.el --- dired configuration
;;; Commentary:
;;; Code:

(defvar dired-open-whitelist '("c" "coffee" "clj" "el"
                               "ex" "exs" "go" "h" "hs"
                               "html" "js" "ml" "md" "rb"
                               "yml" "scala" "slim" "scss"))

(with-eval-after-load "dired"
  (defvar dired-mode-map)

  (require 'dired+)
  (define-key dired-mode-map (kbd "C-f") 'dired-file-open-or-not)
  (define-key dired-mode-map (kbd "RET") 'dired-file-open-or-not)
  (define-key dired-mode-map (kbd "<right>") 'dired-file-open-or-not)
  (define-key dired-mode-map (kbd "C-b") 'dired-up-directory)
  (define-key dired-mode-map (kbd "<left>") 'dired-up-directory)
  (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
  (define-key dired-mode-map (kbd "C-g") 'quit-window)
  (define-key dired-mode-map (kbd "SPC") 'dired/do-quicklook)
  (define-key dired-mode-map (kbd "M-g") 'helm-git-grep)
  (define-key dired-mode-map (kbd "C-M-g") 'magit-status))

(defun my/dired-mode-hook ()
  "My dired mode hook."
  (setq dired-isearch+-return "\C-f")
  ;; for sorting by extensions mac
  (when (eq system-type 'darwin)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil)))

(add-hook 'dired-mode-hook 'my/dired-mode-hook)

(custom-set-variables
 '(delete-by-moving-to-trash t)
 '(trash-directory "~/.Trash")
 '(ls-lisp-dirs-first t)
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always))

(defun dired/do-quicklook ()
  "In dired, preview with Quick Look."
  (interactive)
  (let ((file (dired-get-filename))
        (process (get-process "qlmanage_ps")))
    (if process
        (kill-process process)
      (start-process "qlmanage_ps" nil "qlmanage" "-p" file))))

(defun dired-open-in-accordance-with-situation ()
  "Open file as same buffer when file is directory."
  (interactive)
  (let ((file (dired-get-filename)))
    (if (file-directory-p file)
        (dired-find-alternate-file)
      (dired-find-file))))

;; dired-up-directory(アレントディレクトリに移動)の際にも、別タブで開かない
(defun dired-up-directory (&optional other-window)
  "Run Dired on parent directory of current directory."
  (interactive "P")
  (let* ((dir (dired-current-directory))
         (orig (current-buffer))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (kill-buffer orig)
          (dired up)
          (dired-goto-file dir)))))

(defadvice dired-copy-filename-as-kill (before four-prefix activate)
  (interactive "P")
  (when (eq 4 (prefix-numeric-value (ad-get-arg 0)))
    (ad-set-arg 0 0)))

(defun dired/binary? ()
  (let ((cmd (format "nkf -g %s" (dired/filename-at-point))))
    (string= "BINARY" (util/chomp (shell-command-to-string cmd)))))

(defun dired/filename-at-point ()
  "Return filen at point."
  (car (dired-get-marked-files 'no-dir)))

(defun dired/directory? ()
  (file-directory-p (car (dired-get-marked-files))))

(defun dired/include-whitelist? (filename whitelist)
  (if whitelist
      (or (util/same-ext? filename (car whitelist))
          (dired/include-whitelist? filename (cdr whitelist)))))

(defun dired-file-open-or-not ()
  "File open if file type is directory or file exntion is in whitelist or file is not binary."
  (interactive)
  (let ((ext-lst dired-open-whitelist)
        (filename (dired/filename-at-point)))
    (if (or (dired/directory?)
            (dired/include-whitelist? filename ext-lst)
            (not (dired/binary?)))
        (dired-find-file)
      (if (yes-or-no-p (format "Open %s" filename))
          (dired-find-file)))))

;;; 12_dired.el ends here
