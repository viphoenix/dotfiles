(setq helm-autoresize-max-height 80
	  helm-autoresize-min-height 20
	  helm-ag--ignore-case t
	  helm-ff-skip-boring-files t
	  ;; linum
	  ;; linum-relative-format "%3s "
	  ;; 设置yasnippet 补全的时候不增加缩进
	  yas-indent-line 'fixed
	  ;; 如果是软连接，跟随
	  vc-follow-symlinks t
	  ;; vc中的文件保存时不提示
	  vc-suppress-confirm t

	  evil-want-C-d-scroll t
	  evil-want-C-u-scroll t
	  )
(add-hook 'yas-after-reload-hook
		  (lambda ()
			(message "dmx-yas-after-reload-hook called")
			(setq yas-snippet-dirs (list "~/.spacemacs.d/private/snippets" 'yas-installed-snippets-dir))
			))

;;--begin org config--
(with-eval-after-load 'org
  (local-set-key (kbd "M-O") 'org-insert-heading-after-current)
  (with-eval-after-load 'evil
	(evil-define-key 'normal evil-jumper-mode-map (kbd "TAB") nil)
	(define-key evil-normal-state-map (kbd "TAB") 'org-cycle)
	)

  ;; add files to agenda mode
  (setq org-agenda-files '("~/orgs/" "~/orgs/work/" "~/orgs/work/yytx" "~/orgs/work/playcrab" "~/orgs/common/"))
  ;;== todo setting ==
  ;;== org-babel setting ==
  (setq org-babel-sh-command "/opt/local/bin/bash")
  (setq org-hide-leading-stars t)
  (setq org-startup-indented t)
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
	 (sh . t)
	 (js . t)
	 (lua . t)
	 (C . t)
	 (sed . t)
	 (awk . t)
	 (lisp . t)))

  (require 'org-crypt)
  ;;(org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote("crypt")))
  (setq org-crypt-key "dingmingxin <dingmingxin20@gmail.com>")
  )

;; 有些org 配置直接放到上面的org-mode-hook 中，不知道什么鬼，偶尔有几个配置会不生效
;; 禁止对global_gnu 等类似带有下划线的字符串做特殊处理
(setq org-export-with-sub-superscripts nil)
(setq org-tag-alist '((:startgroup . nil)
					  ("@work" . ?w)
					  ("@life" . ?L)
					  ("@learn" . ?l)
					  ("@programming" . nil)
					  (:endgroup . nil)
					  ("linux" . ?l)
					  ("unity". ?u)
					  ("emacs" . ?E)
					  ("common_lisp" . nil)
					  ("lua" . nil)
					  ("c/c++" . nil)
					  ("opengl" . nil)))
(setq org-use-fast-todo-selection t)
(setq org-use-fast-tag-selection t)
(setq-default org-display-custom-times t)
(setq org-time-stamp-formats '("<%Y-%m-%d %A>" . "<%Y-%m-%d %A %H:%M>"))
(setq org-time-stamp-custom-formats  '("<%Y-%m-%d %A>" . "<%Y-%m-%d %A %H:%M>"))
(setq org-todo-keywords
	  '((sequence "TODO(t)" "DOING(o)" "|" "DONE(d)")
		(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
		(sequence "|" "CANCELED(c)")))
; org-agenda setting
;; 依赖于cal-china-x
 (defun custom-org-agenda-format-date-aligned (date)
   "Format a date string for display in the daily/weekly agenda, or timeline.
 This function makes sure that dates are aligned for easy reading."
   (require 'cal-iso)
   (require 'cal-china-x)
   (let* ((dayname (cal-china-x-day-name date))
		  (day (cadr date))
		  (day-of-week (calendar-day-of-week date))
		  (month (car date))
		  (monthname (format "%02d" month))
		  (year (nth 2 date))
		  (iso-week (org-days-to-iso-week
					 (calendar-absolute-from-gregorian date)))
		  (weekyear (cond ((and (= month 1) (>= iso-week 52))
						   (1- year))
						  ((and (= month 12) (<= iso-week 1))
						   (1+ year))
						  (t year)))
		  (weekstring (if (= day-of-week 1)
						  (format " W%02d" iso-week)
						"")))
	 (format "%-10s %4d/%s/%02d %s" dayname year monthname day weekstring)))
(defalias 'org-agenda-format-date-aligned 'custom-org-agenda-format-date-aligned)

;;--end org config--

;;--begin org-page config--
(setq op/repository-directory "~/Documents/oschina/blog"
	  op/repository-org-branch "master"
	  op/repository-html-branch "osc-pages"
	  op/personal-google-analytics-id "UA-77360714-1"
	  op/personal-github-link "https://github.com/dingmingxin"
	  op/personal-disqus-shortname "everding"
	  op/site-domain "http://everding.oschina.io/"
	  op/site-main-title "从Hello World开始"
	  op/site-sub-title "()==[:::::::::::::> 重剑无锋，大巧不工 "
	  op/theme 'dmx
	  op/category-config-alist '(("blog" ;; this is the default configuration
								  :show-meta t
								  :show-comment nil
								  :uri-generator op/generate-uri
								  :uri-template "/blog/%y/%m/%d/%t/"
								  :sort-by :date     ;; how to sort the posts
								  :category-index t) ;; generate category index or not
								 ("wiki" ;; this is the default configuration
								  :show-meta t
								  :show-comment nil
								  :uri-generator op/generate-uri
								  :uri-template "/wiki/%y/%m/%d/%t/"
								  :sort-by :date     ;; how to sort the posts
								  :category-index t)
								 ("index"
								  :show-meta nil
								  :show-comment nil
								  :uri-generator op/generate-uri
								  :uri-template "/"
								  :sort-by :date
								  :category-index nil)
								 ("about"
								  :show-meta nil
								  :show-comment nil
								  :uri-generator op/generate-uri
								  :uri-template "/about/"
								  :sort-by :date
								  :category-index nil)))

;;--end org-page config

(setq visual-line-mode t)
(setq python-shell-interpreter "/opt/local/bin/python")
;; Make movement keys work like they should
(with-eval-after-load 'evil
					  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
					  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
					  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
					  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line))
;(add-hook 'after-init-hook 'global-company-mode)
;(company-ycmd-setup)
(set-variable 'ycmd-server-command (list "/opt/local/bin/python" (expand-file-name "Documents/github/ycmd/ycmd" "~/")))
(add-hook 'c++-mode-hook 'ycmd-mode)
(add-hook 'c-mode-hook 'ycmd-mode)

(add-hook 'hs-hide-hook (lambda ()
						  "hide linenum when hs-hide-mode is active"
						  (linum-mode 0)))
(add-hook 'hs-show-hook (lambda ()
						  "hide linenum when hs-hide-mode is deactive"
						  (linum-mode 1)))

(setq user-mail-address "dingmingxin20@gmail.com")
(setq user-full-name "dingmingxin")
