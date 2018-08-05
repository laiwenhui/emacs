(setq load-path (cons "/Users/laiwen/.emacs.d/modules/emacs-htmlize" load-path))
(setq load-path (cons "/Users/laiwen/.emacs.d/modules/xml-rpc-el" load-path))
(setq load-path (cons "/Users/laiwen/.emacs.d/modules/metaweblog" load-path))
(setq load-path (cons "/Users/laiwen/.emacs.d/modules/org2blog" load-path))


(require 'org)
(require 'org-install)
(require 'org2blog-autoloads)
(require 'metaweblog)
(require 'xml-rpc)
(require 'htmlize)


(use-package graphviz-dot-mode
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))


;;=======================================================================
(add-to-list
   'org-src-lang-modes '("plantuml" . puml))  
(setq org-export-with-sub-superscripts (quote {}))
(setq org-plantuml-jar-path
        (expand-file-name "/usr/local/Cellar/plantuml/8057/libexec/plantuml.jar")
        )
(setq org-ditaa-jar-path "/Users/laiwen/MyLibs/ditaa0_9/ditaa.jar")


(setq org-src-fontify-natively t)

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
                                                             (plantuml . t)
                                                             (latex . t))))

(setq org-confirm-babel-evaluate nil)

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                "xelatex -interaction nonstopmode %f"))



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


;;===================================================================
(global-set-key (kbd "C-c a a") 'org-agenda)
(global-set-key (kbd "C-c a c") 'org-capture)

(add-hook 'org-agenda-mode-hook '(lambda ()
                                   (define-key org-agenda-mode-map (kbd "C-c a t") 'org-agenda-todo)))



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

  (setq org-directory "~/org/gtd")
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (setq org-agenda-files (list "~/org/gtd/someday.org"
                               "~/org/gtd/home.org"
                               "~/org/gtd/work.org"))

  (setq org-todo-keywords '((sequence "Work(w)"
                                      "Tracking(t@/!)"
                                      "Delayed(d@/!)"
                                      "Personal(p)"
                                      "Next(n)"
                                      "Started(s)"
                                      "|"
                                      "Finish(f)"
                                      "Cancelled(c@/!)")))
  (setf org-todo-keyword-faces
        '(("Next" . (:foreground "yellow" :bold t :weight bold))
          ("Work" . (:foreground "#81D4FA" :bold t :weight bold))
          ("Personal" . (:foreground "#85C1E9" :bold t :weight bold))
          ("Tracking" . (:foreground "#9933FF" :bold t :weight bold))
          ("Started" . (:foreground "springgreen" :bold t :weight bold))
          ("Cancelled" . (:foreground "#DC143C" :bold t :weight bold))
          ("Delayed" . (:foreground "#F06292" :bold t :weight bold))
          ("Finish" . (:foreground "gray50" :bold t :weight bold))))


  (setq org-tag-alist '(("Important&Urgent"               . ?a)
                        ("Important&Not-urgent"           . ?b)
                        ("Not-important&Urgent"           . ?c)
                        ("Not-Important&NOt-urgent"       . ?d)))



  (setq org-capture-templates nil)

  (add-to-list 'org-capture-templates
               '("p" "Personal things" entry (file+headline "~/org/gtd/home.org" "inbox") "*  %?\n  %T\n  %a"))

  (add-to-list 'org-capture-templates

             '("w" "Work things" entry (file+headline "~/org/gtd/work.org" "inbox") "*  %?\n  %T\n  %a"))

  (add-to-list 'org-capture-templates
             '("i" "Ideas" entry (file+headline "" "Ideas") "* %? \n  %T\n  %a"))


  (add-to-list 'org-capture-templates
               '("b" "Billing" plain
                 (file+function "~/org/gtd/billing.org" find-month-tree)
                 " | %U | %^{类别} | %^{描述} | %^{金额} |" :kill-buffer t))




(org-agenda-list t)

;;================================================================
(provide 'init-org-mode-config)
