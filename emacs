(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'xah-fly-keys)

;; specify a layout
(xah-fly-keys-set-layout "colemak")

(xah-fly-keys 1)

(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-startup-banner "/home/hjalmar/.emacs.d/logo.txt")

(setq dashboard-banner-logo-title "Welcome to Emacs!")
(menu-bar-mode -1) 
(scroll-bar-mode -1) 
(tool-bar-mode -1) 
(dirvish-override-dired-mode)
(setq mouse-autoselect-window t)



(when (fboundp 'native-compile-async)
  (setq comp-deferred-compilation t
      comp-deferred-compilation-black-list '("/mu4e.*\\.el$")))


  (native-compile-async "~/.emacs.d/elpa/" 2 t)




  (if (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
    (message "Native compilation is available")
  (message "Native complation is *not* available"))




;; Setup spelling correction
(setq ispell-program-name "aspell")
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(setq ispell-list-command "--list")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages '(dirvish dashboard gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
