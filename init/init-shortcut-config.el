;;按键配置

(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "M-w"))
(global-set-key (kbd "C-w") 'kill-ring-save)
(global-set-key (kbd "M-w") 'kill-region)

(add-hook 'read-only-mode-hook
            '(lambda ();;按原始快捷键定义，去掉前缀键，除了上翻页比较特殊
               (if buffer-read-only (local-set-key  "n" 'next-line)             (local-unset-key (kbd "n")))
               (if buffer-read-only (local-set-key  "p" 'previous-line)         (local-unset-key (kbd "p")))
               (if buffer-read-only (local-set-key  "v" 'scroll-up-command)     (local-unset-key (kbd "v")))
               (if buffer-read-only (local-set-key  "u" 'scroll-down-command)   (local-unset-key (kbd "u")))
               (if buffer-read-only (local-set-key  "f" 'forward-char)          (local-unset-key (kbd "f")))
               (if buffer-read-only (local-set-key  "b" 'backward-char)         (local-unset-key (kbd "b")))
               (if buffer-read-only (local-set-key  "l" 'recenter-top-bottom)   (local-unset-key (kbd "l")))
               (if buffer-read-only (local-set-key  "i" 'my-set-read-only-mode)   (local-unset-key (kbd "i")))
               (if buffer-read-only (local-set-key  "e" 'move-end-of-line)   (local-unset-key (kbd "e")))
               (if buffer-read-only (local-set-key  "a" 'move-beginning-of-line)   (local-unset-key (kbd "a")))
               (if buffer-read-only (local-set-key  "<" 'beginning-of-buffer)   (local-unset-key (kbd "<")))
               (if buffer-read-only (local-set-key  ">" 'end-of-buffer)   (local-unset-key (kbd ">")))

               ))

;;注释
(global-set-key (kbd "C-x C-/") 'comment-or-uncomment-region)


(global-set-key (kbd "C-c d n") '(lambda () (interactive) (dired "~/MyNotes")))
(global-set-key (kbd "C-c d p") '(lambda () (interactive) (dired "~/MyProjects")))
(global-set-key (kbd "C-c d z") 'eshell)
(global-set-key (kbd "C-c g g") 'google)
(global-set-key (kbd "C-c g t") 'google-translate-smooth-translate)
(global-set-key (kbd "\e \e") 'my-set-read-only-mode)
(global-set-key (kbd "C-c d o") 'browse-file-directory)

;;配置helm
(global-set-key [remap isearch-backward-regexp] 'replace-string)
(global-set-key [remap isearch-forward-regexp] 'helm-occur)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key [remap bookmark-set] 'helm-bookmarks)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-x C-h")  'helm-eshell-history)))


;;配置projectile
(global-set-key (kbd "C-c p p") 'helm-projectile)
(global-set-key (kbd "C-c p s") 'helm-projectile-switch-project)
(global-set-key (kbd "C-c p g") 'helm-projectile-grep)



(add-hook
 'dired-mode-hook
    (lambda ()(define-key dired-mode-map (kbd "C-s") 'helm-projectile)
              (define-key dired-mode-map (kbd "C-r") 'helm-projectile-grep)))




;;最后打开我的笔记
(dired "~/MyNotes")

(provide 'init-shortcut-config)
