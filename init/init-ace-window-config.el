(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    )
  :config
  (setq aw-keys '(?a ?b ?c ?d ?e ?f ?g ?h ?i ?j))

  )

(provide 'init-ace-window-config)
