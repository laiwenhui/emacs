(add-to-list 'load-path "/Users/laiwen/.emacs.d/modules/emacs-async")
(add-to-list 'load-path "/Users/laiwen/.emacs.d/modules/popup-el")
(autoload 'dired-async-mode "dired-async.el" nil t)

(use-package flx-ido
  :ensure t)

(use-package helm
  :ensure t)

(use-package helm-dash
  :ensure t)

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
   ;;(projectile-global-mode)
  )

(helm-autoresize-mode 1)
(helm-mode 1)
(dired-async-mode 1)


(setq helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t
      helm-autoresize-max-height            35
      helm-autoresize-min-height            35
      helm-M-x-fuzzy-match                  t
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)


(defvar spacemacs-helm-display-help-buffer-regexp '("\\*.*Helm.*Help.*\\*"))
(defvar spacemacs-helm-display-buffer-regexp `("\\*.*helm.*\\*"
                                               (display-buffer-in-side-window)
                                               (inhibit-same-window . nil)
                                               (side . bottom)
                                               (window-width . 0.6)
                                               (window-height . 0.4)))

(defun display-helm-at-bottom (buffer &optional _resume)
  (let ((display-buffer-alist (list spacemacs-helm-display-help-buffer-regexp
                                    spacemacs-helm-display-buffer-regexp)))
    (display-buffer buffer)))
(setq helm-display-function 'display-helm-at-bottom)


(defun helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'helm-hide-minibuffer-maybe)


(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

;;功能未实现
(defun helm-find-files-readonly ()

  (interactive)

  (setq my-current-buffer (get-buffer (buffer-name)))
   (setq my-current-file  (buffer-file-name my-current-buffer))
   
  (if (eq my-current-file nil)
      (setq my-current-file  default-directory))

  (setq my-new-buffer (helm-find-files-1 my-current-file))
 
  (setq my-new-file  (buffer-file-name my-new-buffer))
 (message "my new file %s" my-new-file) 
  (if (file-exists-p my-new-file) 
      (progn (message "set read only mode")
             (read-only-mode t))))

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

;;http://tuhdo.github.io/helm-projectile.html
;;http://tuhdo.github.io/helm-intro.html
;;https://github.com/emacs-helm/helm
;;================================================================
(provide 'init-helm-config)
