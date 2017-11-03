

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
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
(global-set-key (kbd "<f2>") 'open-my-init-file)

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
