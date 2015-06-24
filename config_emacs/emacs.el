;;== el-get ==
(add-to-list 'load-path "~/.emacs.d/config")
(require 'dmx-emacs)
(dmx-require 'dmx-init-el-get)
(dmx-require 'dmx-init-slime)
(dmx-require 'dmx-init-helm)
(dmx-require 'dmx-init-evil)
(dmx-require 'dmx-init-projectile)

(add-to-list 'load-path "~/.emacs.d/el-get/magit")
(add-to-list 'load-path "~/.emacs.d/el-get/git-modes")
;(add-to-list 'load-path "~/.emacs.d/el-get/avy")

;;== ido mode ==
(require 'ido)
(ido-mode 1)
;(ido-everywhere 1)

(add-to-list 'load-path "~/.emacs.d/el-get/ido-ubiquitous")
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;;== lua-mode ==
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("[Ss]lua.*\\.txt$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;== auto-complete ==
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;;== yasnipet ==
(require 'yasnippet)
(yas-global-mode 1)

;;== emmet-mode ==
(require 'emmet-mode)

;;== expand-region ==
(add-to-list 'load-path "~/.emacs.d/el-get/expand-region")
(require 'expand-region)
;(global-set-key (kbd "C-=") 'er/expand-region)

;;== tag files ==
(setq tags-file-name "./tags")
;;== powerline ==
;(require 'powerline)
;(powerline-center-evil-theme)


;; common settings
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(global-linum-mode 1)

;; backup file setting
(setq backup-directory-alist `((".*" . , "~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
	  kept-new-versions 6
	  kept-old-versions 2
	  version-control t)

;; enable syntax highlight
(setq global-font-lock-mode 1)
;; set tab stop
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq linum-format
      (lambda
        (line)
        (propertize
         (format
          (let
              ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(ido-mode (quote both) nil (ido))
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )