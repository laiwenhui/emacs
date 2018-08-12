


(global-set-key (kbd "C-c g g") 'google)
(global-set-key (kbd "C-c g t") 'google-translate-smooth-translate)
(global-set-key (kbd "\e \e") 'my-set-read-only-mode)
(global-set-key (kbd "C-c d o") 'browse-file-directory)
(define-key ibuffer-mode-map (kbd "C-x C-f") 'helm-find-files)





;;最后打开我的笔记
(dired "~/MyNotes")

(provide 'init-shortcut-config)
