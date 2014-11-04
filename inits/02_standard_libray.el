;; ----------------- @tramp ------------------------
(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-persistency-file-name "~/.emacs.d/log/tramp")

;; ----------------- @uniquify ------------------------
;;; バッファ名
;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; ----------------- @filecache ------------------------
(require 'filecache)
(file-cache-add-directory-list
 '("~/.emacs.d" "~/.emacs.d/inits"))

(define-key minibuffer-local-completion-map "\C-x\C-f"
  'file-cache-minibuffer-complete)

;; Add to file-cache when `kill-buffer'
(defun file-cache-add-this-file ()
  (and buffer-file-name
       (file-exists-p buffer-file-name)
       (file-cache-add-file buffer-file-name)))
(add-hook 'kill-buffer-hook 'file-cache-add-this-file)

;; ----------------- @whitespace-----------------------

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

;; ----------------- @usc-normalize-----------------------
;; pdfコピーの時の濁点分離を治す
(require 'ucs-normalize)
(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max)))

;; ----------------- @align ------------------------

(require 'align)
(add-to-list 'align-rules-list
             '(js-assignment-literal
               (regexp . "\\(\\s-*\\)=")))

;; js2
(add-to-list 'align-rules-list
             '(js-object-attribute
               (regexp . ":\\(\\s-*\\)")
               (modes  . '(js2-mode))))


(add-to-list 'align-rules-list
             '(php-assignment
               (regexp   . "[^-=!^&*+<>/.| \t\n]\\(\\s-*[.-=!^&*+<>/|]*\\)=>?\\(\\s-*\\)\\([^= \t\n]\\|$\\)")
               (justify  . t)
               (tab-stop . nil)
               (modes    . '(php-mode))))

(add-to-list 'align-dq-string-modes 'php-mode)
(add-to-list 'align-sq-string-modes 'php-mode)
(add-to-list 'align-open-comment-modes 'php-mode)
(setq align-region-separate (concat "\\(^\\s-*$\\)\\|"
                                    "\\([({}\\(/\*\\)]$\\)\\|"
                                    "\\(^\\s-*[)}\\(\*/\\)][,;]?$\\)\\|"
                                    "\\(^\\s-*\\(}\\|for\\|while\\|if\\|else\\|"
                                    "switch\\|case\\|break\\|continue\\|do\\)[ ;]\\)"
                                    ))


(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruy-mode))))
(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-assignment-literal
               (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-xmpfilter-mark
               (regexp . "\\(\\s-*\\)# => [^#\t\n]")
               (repeat . nil)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(camma-assignment
               (regexp . ",\\( *\\)")
               (repeat . t)))

(global-set-key (kbd "C-c i") 'align)

;; -----------------  @saveplace ------------------------

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/log/saved-places")


;; ;; -----------------  @YaTex ------------------------

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))

(with-eval-after-load 'yatex
  (setq YaTeX-inhibit-prefix-letter t)
  (setq YaTeX-kanji-code nil)
  (setq YaTeX-use-LaTeX2e t)
  (setq YaTeX-use-AMS-LaTeX t)
  (setq YaTeX-dvi2-command-ext-alist
        '(("Preview\\|TeXShop\\|TeXworks\\|Skim\\|mupdf\\|xpdf\\|Firefox\\|Adobe" . ".pdf")))
  (setq tex-command "/usr/texbin/ptex2pdf -l -ot '-synctex=1'")
  (setq bibtex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/upbibtex")
                             ((string-match "platex" tex-command) "/usr/texbin/pbibtex")
                             ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/bibtexu")
                             ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/bibtex")
                             (t "/usr/texbin/pbibtex")))
  (setq makeindex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/mendex")
                                ((string-match "platex" tex-command) "/usr/texbin/mendex")
                                ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/texindy")
                                ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/makeindex")
                                (t "/usr/texbin/mendex")))
  ;; (setq dvi2-command "/usr/bin/open -a Preview")
  (setq dvi2-command "/usr/bin/open -a Skim")
  (setq dviprint-command-format "/usr/bin/open -a \"Adobe Reader\" `echo %s | sed -e \"s/\\.[^.]*$/\\.pdf/\"`")
  (auto-fill-mode -1)
  (reftex-mode 1))

(defun skim-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "displayline"
      nil
      "/Applications/Skim.app/Contents/SharedSupport/displayline"
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      buffer-file-name))))

(defun my-yatex-mode-hook ()
  (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)
  (define-key YaTeX-mode-map (kbd "<f8>") 'YaTeX-typeset-menu)
  (define-key YaTeX-mode-map (kbd "s-R") 'YaTeX-typeset-menu)
  (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
  (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region))
(add-hook-lambda 'yatex-mode-hook 'my-yatex-mode-hook)
