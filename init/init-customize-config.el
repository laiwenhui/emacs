;;;****************************************

(use-package google-translate
  :ensure t
  )

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

;; (global-set-key (kbd "C-c g g") 'google)
;; (global-set-key (kbd "C-c g t") 'google-translate-smooth-translate)



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


;;( global-set-key (kbd "\e \e") 'my-set-read-only-mode)


(defun browse-file-directory ()
    "Open the current file's directory however the OS would."
    (interactive)
    (if default-directory
        (browse-url-of-file (expand-file-name default-directory))
      (error "No `default-directory' to open")))



;; (global-set-key (kbd "C-c d o") 'browse-file-directory)
;; (define-key ibuffer-mode-map (kbd "C-x C-f") 'helm-find-files)








(provide 'init-customize-config)