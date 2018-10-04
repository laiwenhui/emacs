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


(auto-image-file-mode t)
(setq visible-bell t)


;;字体设置
;;(set-default-font  "Source Code Pro-15")
(set-default-font  "YaHei Consolas Hybrid-15")

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

;;dired 显示可读文件大小单位
(setq dired-listing-switches "-alh")
(setq dired-auto-revert-buffer t)
(add-hook 'dired-mode-hook 'auto-revert-mode)

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

(setq minibuffer-default 1)
(setq initial-scratch-message nil)
(setq kill-ring-max 200)
(setq kill-do-not-save-duplicates t)

(delete-selection-mode 1)

(setq-default savehist-additional-variables
      '(kill-ring))
(savehist-mode 1)


;; (setq-default
;;  enable-recursive-minibuffers t        ;在minibuffer 中也可以再次使用minibuffer
;;  history-delete-duplicates t          ;minibuffer 删除重复历史
;;  minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)) ;;;;minibuffer prompt 只读，且不允许光标进入其中
;;  resize-mini-windows t ;; 当minibuffer 内容一行显示不下来时 允许调整minibuffer大小
;;  enable-recursive-minibuffers t
;;  read-buffer-completion-ignore-case t ;;补全buffer名时忽略大小写
;;  read-file-name-completion-ignore-case t;;补全文件名时忽略大小写
;;  completion-cycle-threshold 8)



;;===============================================
(provide 'init-base-config)
