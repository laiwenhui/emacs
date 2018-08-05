(use-package company
:ensure t
:config
(setq company-idle-delay 0.5)
(setq company-show-numbers t)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(global-company-mode t))

(use-package company-irony
:ensure t
:config 
(add-to-list 'company-backends 'company-irony))

(use-package irony
:ensure t
:config
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package irony-eldoc
:ensure t
:config
(add-hook 'irony-mode-hook #'irony-eldoc))

;; (use-package company-jedi
;;     :ensure t
;;     :config
;;     (add-hook 'python-mode-hook 'jedi:setup))

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "\t") 'company-complete-common)

;;http://company-mode.github.io/
;;================================================================
(provide 'init-company-config)