;; Straight el bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Setup xah fly keys with colemak layout
(straight-use-package 'xah-fly-keys)
(require 'xah-fly-keys)
(xah-fly-keys-set-layout "colemak")
(xah-fly-keys 1)

;; Setup dashboard with custom logo
(straight-use-package 'dashboard)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "/home/hjalmar/.emacs.d/logo.txt")
(setq dashboard-banner-logo-title "Welcome to Emacs!")

;; Enable and use gruvbox theme
(straight-use-package 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)


;; Setup dirvish file browser
(straight-use-package 'dirvish)
(dirvish-override-dired-mode) ;; make dirvish overide dired

;; Remove some GUI elements 
(menu-bar-mode -1) ;; Disable menu bar 
(scroll-bar-mode -1) ;; Disable the scroll bar 
(tool-bar-mode -1) ;; Disable the tool bar

;; Make focus follows mouse
(setq mouse-autoselect-window t)

;; Enable native compiling of lisp code 
(when (fboundp 'native-compile-async)
  (setq comp-deferred-compilation t
      comp-deferred-compilation-black-list '("/mu4e.*\\.el$")))
;; Disable native comp warnings
(setq native-comp-async-report-warnings-errors nil)

;; Setup spelling correction
(setq ispell-program-name "aspell") ;; Make spell checking use aspell instead of ispell
(global-set-key (kbd "<f8>") 'ispell-word) ;; Make F8 spell check a word 
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode) ;; Make Ctrl + Shift + F8 toggle spell check mode
(setq ispell-list-command "--list")
