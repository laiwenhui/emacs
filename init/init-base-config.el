(require 'package)

;;设置网络
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1080 5))

(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))


;;字体设置
(set-default-font  "Source Code Pro-15")

;;窗口最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;tab键设置
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq indent-line-function 'insert-tab)

;;去掉工具栏
(tool-bar-mode 0) 
(scroll-bar-mode 0)

;;去掉启动画面
(setq inhibit-startup-message t)

;;设置个人信息
(setq user-full-name "wenhui lai") 
(setq user-mail-address "laiwenhui@foxmail.com") 


;;显示时间
(display-time-mode 1) 
(setq display-time-24hr-format t) 

;;简化回答
(fset 'yes-or-no-p 'y-or-n-p) 

;;显示行号
(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(global-hl-line-mode t)


;;取消自动备份
(setq make-backup-files nil)

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





(global-set-key  (kbd "C-c d n") '(lambda () (interactive) (dired "~/MyNotes")))
(global-set-key  (kbd "C-c d t") '(lambda () (interactive) (dired "~/org/gtd")))
(global-set-key  (kbd "C-c d p") '(lambda () (interactive) (dired "~/MyProjects")))
(global-set-key (kbd "C-c d z") 'eshell)


(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(defalias 'list-buffers 'ibuffer)


(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-deferred-git-apply-delay   0.5
          treemacs-display-in-side-window     t
          treemacs-file-event-delay           5000
          treemacs-file-follow-delay          0.2
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-no-png-images              nil
          treemacs-project-follow-cleanup     nil
          treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)


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
  



  

;;===============================================
(provide 'init-base-config)
