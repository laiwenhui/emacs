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



(defalias 'list-buffers 'ibuffer)



  

;;===============================================
(provide 'init-base-config)
