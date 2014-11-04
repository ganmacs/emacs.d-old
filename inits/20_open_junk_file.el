(require 'open-junk-file)
(custom-set-variables
 '(open-junk-file-find-file-function 'find-file)
 '(open-junk-file-format "~/Documents/Junk/%Y/%m%d-%H%M%S."))
(global-set-key (kbd "C-x j") 'open-junk-file)
