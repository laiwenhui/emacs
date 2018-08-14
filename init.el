(defvar devotee-root-dir (file-name-directory load-file-name)
  "The root dir of the Emacs devotee distribution.")

(defvar devotee-init-dir (expand-file-name "init" devotee-root-dir)
  "The home of devotee's init functionality.")

(add-to-list 'load-path devotee-init-dir)

;;===============================

(require 'init-base-config)
(require 'init-spacemacs-theme-config)
(require 'init-company-config)
(require 'init-avy-config)
(require 'init-ace-window-config)
(require 'init-org-mode-config)
(require 'init-magit-config)
(require 'init-dash-config)
(require 'init-which-key-config)
(require 'init-easy-kill-config)
(require 'init-yasnippet-config)
(require 'init-undo-tree-config)
(require 'init-helm-config)
(require 'init-c-lang-config)
(require 'init-python-config)



;;=======================================
(require 'init-customize-config)
(require 'init-shortcut-config)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tex auctex ag helm-projectile-ag projectile-ag helm-descbinds helm-dash flx-ido helm-ag markdown-mode flymd autopair helm-google graphviz-dot-mode anaconda-mode treemacs-projectile treemacs spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
