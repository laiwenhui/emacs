(use-package ghub :ensure t  )
(use-package dash  :ensure t  )
(use-package magit-popup :ensure t  )
(use-package with-editor  :ensure t  )
(use-package magit  :ensure t
  :config (global-set-key (kbd "C-c m s") 'magit-status)
          (global-set-key (kbd "C-c m c") 'magit-clone) )



;;================================================================
(provide 'init-magit-config)
