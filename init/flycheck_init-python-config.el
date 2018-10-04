;;; package --- Summary
(setq exec-path (append exec-path '("~/anaconda3/bin/")))
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setenv "LC_ALL" "en_US.UTF-8")
(custom-set-variables
 '(py-shell-switch-buffers-on-execute nil))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;;========================================================================================
  (defun config/enable-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))

(use-package company-jedi             ;;; company-mode completion back-end for Python JEDI
  :ensure t
  :config
  (setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.python-environments/")))
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (add-hook 'python-mode-hook 'run-python-internal)
  (add-hook 'python-mode-hook 'config/enable-company-jedi))
;;========================================================================================

(setq   python-indent-offset 4
        default-tab-width 4
        python-shell-interpreter-args "-i"
        python-shell-interpreter  "~/anaconda3/bin/ipython3"
        )



(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;================================================================
(provide 'init-python-config)
