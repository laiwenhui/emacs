;;;****************************************
(use-package multiple-cursors
  :ensure t)


(use-package google-translate
  :ensure t
  )


(use-pa)


(setq-default google-translate-enable-ido-completion t)
(setq google-translate-translation-directions-alist '(("en" . "zh-CN")))

(defun google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))



(eval-after-load 'google-translate-core
  '(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
         google-translate-listen-url "http://translate.google.cn/translate_tts"))

(eval-after-load 'google-translate-tk
  '(setq google-translate--tkk-url "http://translate.google.cn/"))


(defun my-set-read-only-mode()
  "define read only mode"
  (interactive)
  (buffer-local-value 'buffer-read-only (get-buffer (buffer-name)))
  (if (eq  buffer-read-only t)
      (progn
        (message "set writeable ")
        (read-only-mode -1))
    (progn
      (message "set readonly")
      (read-only-mode t))))



(defun browse-file-directory ()
    "Open the current file's directory however the OS would."
    (interactive)
    (if default-directory
        (browse-url-of-file (expand-file-name default-directory))
      (error "No `default-directory' to open")))




(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))


(use-package pcre2el
:ensure t
:config 
(pcre-mode)
)



(use-package highlight-parentheses
  :ensure t
  :config
  (define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
  (global-highlight-parentheses-mode t)
  )

;;自动添加括号、""等
(use-package autopair
  :ensure t
  :config
  (autopair-global-mode t))

(use-package markdown-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)) )

(use-package flymd
  :ensure t
  :config
  (defun my-flymd-browser-function (url)
  (let ((process-environment (browse-url-process-environment)))
    (apply 'start-process
           (concat "firefox " url)
           nil
           "/usr/bin/open"
           (list "-a" "firefox" url))))
(setq flymd-browser-open-function 'my-flymd-browser-function))


(provide 'init-customize-config)
