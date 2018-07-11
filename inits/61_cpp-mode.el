;;; 61_cpp.el --- c++ mode configuration
;;; Commentary:
;;; Code:

(defun my/c++-mode-hook ()
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq flycheck-gcc-language-standard "c++11")
  (setq flycheck-clang-language-standard "c++11")
  (setq company-backends (delete 'company-semantic company-backends))
  (auto-complete-mode -1)
  (define-key c++-mode-map [(tab)] 'company-complete)
  (add-to-list 'company-backends '(company-dabbrev-code company-dabbrev company-clang company-gtags company-keywords add-))
  )

(add-hook 'c++-mode-hook 'my/c++-mode-hook)

;;; 61_cpp.el ends here
