(use-package avy
  :ensure t
  :config
  (avy-setup-default)
  (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1))  

;;================================================================
(provide 'init-avy-config)
