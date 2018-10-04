
(load "auctex.el" nil t t)



(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))  
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))

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




(defun reload-pdf ()
  (interactive
  (let* ((fname buffer-file-name)
        (fname-no-ext (substring fname 0 -4))
        (pdf-file (concat fname-no-ext ".pdf"))
        (cmd (format "pdflatex %s" fname)))
    (delete-other-windows)
    (split-window-horizontally)
    (split-window-vertically)
    (shell-command cmd)
    (other-window 2)
    (find-file pdf-file)
    (balance-windows))))

(global-set-key "\C-x\p" 'reload-pdf)


;;================================================================
(provide 'init-auctex-config)
