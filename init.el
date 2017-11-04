

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;添加MELPA源
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;定义默认安装的软件包
;; Add Packages
(require 'cl)
 (defvar doovemax/packages '(
		;; --- Auto-completion ---
		company
		hungry-delete
		monokai-theme
		jedi
		swiper
		counsel
		;; solarized-theme
		) "Default packages")

(setq package-selected-packages doovemax/packages)
(defun doovemax/packages-installed-p()
  (loop for pkg in doovemax/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (doovemax/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg doovemax/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;;关闭工具栏
(tool-bar-mode -1)
;;关闭右侧滚动条
(scroll-bar-mode -1)
;;关闭自动缩进
;;(electric-indent-mode -1)
;;开启行号
(linum-mode t)
;;关闭启动画面
(setq inhibit-splash-screen t)

;;定义打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;;绑定f2打开配置文件
(global-set-key (kbd "<f11>") 'open-my-init-file)

;;打开括号补全
(electric-pair-mode t)
;;开启全局自动补全
(global-company-mode t)
;;修改光标形状
(setq-default cursor-type 'bar)
;;关闭备份文件
(setq make-backup-files nil)
;;开启历史记录
(require 'recentf)
(setq recentf-max-saved-items 10)
(recentf-mode 1)
;;启动时全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;切换删除模式
(delete-selection-mode t)
;;括号匹配高亮
(show-paren-mode t)
;;或者(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;高亮当前行
;;(global-hl-line-mode t)


;;设置默认主题
(load-theme 'monokai t)

;;开启hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)
;;开启swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;等待多长时间自动补全
(setq company-idle-delay 0.2)
