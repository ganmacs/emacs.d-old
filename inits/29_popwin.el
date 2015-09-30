;;; 29_popwin.el --- popwin configuration
;;; Commentary:
;;; Code:

(require 'popwin)
(popwin-mode 1)

(push '("^\*Helm .+\*$" :regexp t :width 0.4 :position right) popwin:special-display-config)
(push '("^\*helm .+\*$" :regexp t :width 0.4 :position right) popwin:special-display-config)
(push '("^\*helm for files.+\*$" :regexp t :height 0.5) popwin:special-display-config)
(push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)
(push '("*quickrun*") popwin:special-display-config)
(push '("*cider-doc*") popwin:special-display-config)
(push '("*cider-error*") popwin:special-display-config)

;; (require 'popwin-yatex)
;; (push '("*YaTeX-typesetting*" :noselect t) popwin:special-display-config)

;;; 29_popwin.el ends here
