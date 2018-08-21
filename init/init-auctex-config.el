(load "auctex.el" nil t t)

(if (string-equal system-type "windows-nt")
	(require 'tex-mik))
	

(setq-default TeX-master nil) ; Query for master file.

(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (add-hook 'LaTeX-mode-hook (lambda()( autopair-mode -1)))
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))


(use-package cdlatex
  :ensure t
  :config
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex))

(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))  
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))


;;================================================================
(provide 'init-auctex-config)
