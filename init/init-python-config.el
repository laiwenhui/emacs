;;; package --- Summary

(use-package elpy
:ensure t
:config (elpy-enable))

(use-package flycheck
  :ensure t
  :init  (global-flycheck-mode t))


(use-package py-autopep8
  :ensure t
  :config (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package better-defaults
  :ensure t)

(use-package ein
  :ensure t)

;; (use-package anaconda-mode 
;;   :ensure t
;;   :config (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;   (add-to-list 'company-backends 'company-anaconda))


(setq   python-indent-offset 4
        python-indent 4
        indent-tabs-mode nil
        python-indent-guess-indent-offset nil
        default-tab-width 4
        ;; 设置 run-python 的参数
        python-shell-interpreter  "/Users/laiwen/anaconda/bin/ipython3"
        python-shell-interpreter-args "-i"
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
        python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setenv "LC_ALL" "en_US.UTF-8")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;================================================================
(provide 'init-python-config)
