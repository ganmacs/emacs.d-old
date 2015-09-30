;;; 02_standard_libray.el --- standard library configuration
;;; Commentary:
;;; Code:

(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-persistency-file-name "~/.emacs.d/log/tramp")

(require 'uniquify)
;; Show a directory name when same file name exist in opening buffer
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(require 'filecache)
(file-cache-add-directory-list
 '("~/.emacs.d" "~/.emacs.d/inits"))

(define-key minibuffer-local-completion-map "\C-x\C-f"
  'file-cache-minibuffer-complete)

(defun file-cache-add-this-file ()
  "Add to file-cache when `kill-buffer'."
  (and buffer-file-name
       (file-exists-p buffer-file-name)
       (file-cache-add-file buffer-file-name)))
(add-hook 'kill-buffer-hook 'file-cache-add-this-file)


(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)


(require 'ucs-normalize)
;; pdfコピーの時の濁点分離を治す
(defun ucs-normalize-NFC-buffer ()
  "Normalize NFC buffer."
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max)))

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/log/saved-places")

;;; 02_standard_libray.el ends here
