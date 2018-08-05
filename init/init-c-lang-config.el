(use-package ggtags
  :ensure t
  :config 
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1))))
)


(add-hook 'c-mode-hook
            '(lambda ()
               (c-set-style "k&r")
                (c-basic-offset 4)))

(add-hook 'c++-mode-hook
            '(lambda ()
               (c-set-style "stroustrup")))


(add-hook 'c-mode-hook 
      (lambda ()
        (setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")           (semantic-load-enable-code-helpers)
        (setq company-idle-delay t)
        (company-mode)))

(add-hook 'c++-mode-hook 
      (lambda ()
        (setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")           (semantic-load-enable-code-helpers)
        (setq company-idle-delay t)
        (company-mode)))

(provide 'init-c-lang-config)
