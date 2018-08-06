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

(global-set-key (kbd "C-c g  g") 'google)
(global-set-key (kbd "C-c g t") 'google-translate-smooth-translate)


;;(create-file-buffer "~/.emacs.d")
;;(dired "~/MyNotes")
;;(dired "~/.emacs.d")

(provide 'init-last-config)
