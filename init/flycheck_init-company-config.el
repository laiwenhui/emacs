(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-ignore-case t)
  (setq company-idle-delay 0.3)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (add-hook 'after-init-hook 'global-company-mode)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-s") #'company-filter-candidates)
  (global-set-key (kbd "C-c y") 'company-yasnippet)
  )

(use-package company-quickhelp
  :ensure t
  :config
  (add-hook 'after-init-hook 'company-quickhelp-mode)
  )




;;http://company-mode.github.io/
;;================================================================
(provide 'init-company-config)
