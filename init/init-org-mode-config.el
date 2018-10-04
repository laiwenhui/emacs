(setq load-path (cons "~/.emacs.d/modules/org2blog" load-path))

(require 'org)
(require 'org-install)
(require 'org2blog-autoloads)

;;(use-package org2blog
;;  :ensure t)

(use-package graphviz-dot-mode
  :ensure t)

(use-package org-bullets
  :ensure t)

(use-package metaweblog
  :ensure t)

(use-package xml-rpc
  :ensure t)

(use-package htmlize 
  :ensure t)

(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook  (lambda ()(setq truncate-lines nil)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;=======================================================================
(add-to-list
   'org-src-lang-modes '("plantuml" . puml))  
(setq org-export-with-sub-superscripts (quote {}))
(setq org-plantuml-jar-path
        (expand-file-name "/usr/local/Cellar/plantuml/1.2018.9/libexec/plantuml.jar"))
(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.11.0/libexec/ditaa-0.11.0-standalone.jar")


 (with-eval-after-load 'org
    (org-babel-do-load-languages 'org-babel-load-languages '((ruby . t)
                                                             (plantuml . t)
                                                             (dot . t)
                                                             (calc . t)
                                                             (ditaa . t)
                                                             (R . t)
                                                             (C . t)
                                                             (gnuplot . t)
                                                             (shell . t)
                                                             (org . t)
                                                             (python . t)
                                                             (clojure . t)
                                                             (java . t)
                                                             (plantuml . t)
                                                             (latex . t)
                                                             (scheme . t))))
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t)

(setq org-babel-python-command "~/anaconda3/bin/python3.6")


(defun shk-fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))
(add-hook 'org-babel-after-execute-hook 'shk-fix-inline-images)




(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/ :/usr/local/bin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                "xelatex -interaction nonstopmode %f"))




;;colored source code when exporting to LaTeX
(require 'org-install)
(require 'ox-latex)
(setq org-latex-listings t)
(setq org-export-latex-listings t)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))



;;====================================================================

  (setq org2blog/wp-blog-alist
        '(("mr.lai"
           :url "http://devotee.info/xmlrpc.php"
           :username "laiwenhui"
           :password "Wen@19870817"
           :confirm nil
           :wp-code nil
           :default-title "org-mode"
           :default-categories ("org")
           :wp-latex t
           :sourcecode-langs (list "bash"
                                   "cpp"
                                   "css"
                                   "diff"
                                   "html"
                                   "javascript"
                                   "java"
                                   "latex"
                                   "matlab"
                                   "perl"
                                   "python"
                                   "ruby"
                                   "sql"
                                   "r"
                                   "text"
                                   "xml")
           :tags-as-categories nil)))


;;####################################################################################################
(use-package org-pomodoro
  :ensure t)

(defun notify-osx (title message)   
	(call-process "/usr/local/bin/terminal-notifier"
		nil 0 nil		 
		"-group" "Emacs"		 
		"-title" title		 
		"-sender" "org.gnu.Emacs"		 
		"-message" message		 
		"-activate" "oeg.gnu.Emacs"))

(add-hook 'org-pomodoro-finished-hook
	(lambda ()
		(notify-osx "Pomodoro completed!" "Time for a break.")))
(add-hook 'org-pomodoro-break-finished-hook
	(lambda ()
        (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-long-break-finished-hook
	(lambda ()
		(notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-killed-hook    
	(lambda ()
		(notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))

;;####################################################################################################
;;全屏显示agenda list
(setq org-agenda-window-setup t)
(setq calendar-week-start 1) 



(defun get-year-and-month ()
  (list (format-time-string "%Y年") (format-time-string "%m月")))

(defun find-month-tree ()
  (let* ((path (get-year-and-month))
         (level 1)
         end)
    (unless (derived-mode-p 'org-mode)
      (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
    (goto-char (point-min))             ;移动到 buffer 的开始位置
    ;; 先定位表示年份的 headline，再定位表示月份的 headline
    (dolist (heading path)
      (let ((re (format org-complex-heading-regexp-format
                        (regexp-quote heading)))
            (cnt 0))
        (if (re-search-forward re end t)
            (goto-char (point-at-bol))  ;如果找到了 headline 就移动到对应的位置
          (progn                        ;否则就新建一个 headline
            (or (bolp) (insert "\n"))
            (if (/= (point) (point-min)) (org-end-of-subtree t t))
            (insert (make-string level ?*) " " heading "\n"))))
      (setq level (1+ level))
      (setq end (save-excursion (org-end-of-subtree t t))))
    (org-end-of-subtree)))

  (setq org-directory "~/.emacs.d/org/gtd/")
  (setq org-default-notes-file (concat org-directory "inbox.org"))
  (setq org-agenda-files (list "~/.emacs.d/org/gtd/inbox.org"))

(setq org-todo-keywords '((sequence
                           "Plan(p!)"
                           "Todo(t)"
                           "Delayed(d@/!)"
                           "Next(n!)"
                           "Started(s!)"
                           "|"
                           "Finish(f@/!)"
                           "Cancelled(c@/!)")))
  (setf org-todo-keyword-faces
        '(
          ("Next" . (:foreground "yellow" :bold t :weight bold))
          ("Todo" . (:foreground "#81D4FA" :bold t :weight bold))
          ("Plan" . (:foreground "#9933FF" :bold t :weight bold))
          ("Started" . (:foreground "springgreen" :bold t :weight bold))
          ("Cancelled" . (:foreground "#DC143C" :bold t :weight bold))
          ("Delayed" . (:foreground "#F06292" :bold t :weight bold))
          ("Finish" . (:foreground "gray50" :bold t :weight bold))))


  (setq org-tag-alist '(("Important&Urgent"               . ?a)
                        ("Important&Not-urgent"           . ?b)
                        ("Not-important&Urgent"           . ?c)
                        ("Not-Important&NOt-urgent"       . ?d)))



  (setq org-log-done 'time)
  (setq org-capture-templates nil)
  (setq org-enforce-todo-dependencies t)

  (add-to-list 'org-capture-templates
             '("i" "Ideas" entry (file+headline "" "ideas") "* %? \n  %U\n  %a"))

  (add-to-list 'org-capture-templates
               '("b" "Billing" plain
                 (file+function "~/.emacs.d/org/gtd/billing.org" find-month-tree)
                 " | %U | %^{类别} | %^{描述} | %^{金额} |" :kill-buffer t))

  (add-to-list 'org-capture-templates
               '("t" "Technical Support" plain
                 (file+function "~/.emacs.d/org/gtd/TechnicalSupport.org" find-month-tree)
                 "| %^{区域} | %^{沟通方式} | %^{人员} | %^{产品}| %^{客户} | %^{状态} |%^{问题}| %^{处理}| %U|":kill-buffer t))

  (add-to-list 'org-capture-templates
             '("d" "Department management" entry (file+headline "" "management") "* %? \n  %U\n  %a"))

               
(defun org-summary-todo (n-done n-not-done)
      "Switch entry to DONE when all subentries are done, to TODO otherwise."
      (let (org-log-done org-log-states)   ; turn off logging
        (org-todo (if (= n-not-done 0) "Finish" "Plan"))))
    
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;;================================================================
(use-package cal-china-x
  :ensure t
  :config
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
(setq calendar-holidays
      (append cal-china-x-important-holidays
              cal-china-x-general-holidays)))

(setq mark-holidays-in-calendar t)
(setq org-agenda-include-diary t)




;; (require 'org-export-latex)
;; (add-to-list 'org-export-latex-classes 
;; '("myarticle" 
;; "\\documentclass[11pt]{article}"
;;      ("\\section{%s}" . "\\section*{%s}")
;;      ("\\subsection{%s}" . "\\subsection*{%s}")
;;      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;      ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;      ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;;========================================================================================
;; (setq load-path (cons "~/.emacs.d/modules/anki-editor/" load-path))
(require 'anki-editor)
;; (use-package anki-editor
;;   :ensure t)



(provide 'init-org-mode-config)
