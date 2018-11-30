;;; 26_undo-tree.el --- undo-tree mode configuration
;;; Commentary:
;;; Code:

(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-,") 'undo-tree-redo)

;;; 26_undo-tree.el ends here
