(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (define-key ac-mode-map (kbd "TAB") 'auto-complete)
)

;;================================================================
(provide 'init-auto-complete-config)
