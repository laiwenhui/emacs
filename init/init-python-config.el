;;; package --- Summary



;; (use-package jedi
;;   :ensure t)

;; (use-package elpy
;;   :ensure t
;;   :config
;;   (setq elpy-rpc-backend "jedi")
;;   (elpy-enable)
;;   (add-hook 'python-mode-hook 'elpy-mode)
;;   )

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)


;; (use-package flycheck
;;   :ensure t
;;   :init  (global-flycheck-mode t))


;; (use-package better-defaults
;;   :ensure t)


;; (setq auto-mode-alist
;;       (append '(("SConstruct\\'" . python-mode)
;;                 ("SConscript\\'" . python-mode))
;;               auto-mode-alist))

;; (require-package 'pip-requirements)

;; (when (maybe-require-package 'anaconda-mode)
;;   (after-load 'python
;;     (add-hook 'python-mode-hook 'anaconda-mode)
;;     (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
;;   (when (maybe-require-package 'company-anaconda)
;;     (after-load 'company
;;       (add-hook 'python-mode-hook
;;                 (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

(setq   python-indent-offset 4
        indent-tabs-mode nil
        python-indent-guess-indent-offset nil
        default-tab-width 4
        python-shell-interpreter  "/Library/Frameworks/Python.framework/Versions/3.6/bin/ipython3"

  ;;      python-shell-interpreter  "~/anaconda/bin/ipython3"
        python-shell-interpreter-args "-i"
        )

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setenv "LC_ALL" "en_US.UTF-8")


;;================================================================
(provide 'init-python-config)
