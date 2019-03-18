;; init-style.el
;; initializes emacs style preferences


;; install theme
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package linum-relative
  :ensure t
  :init
  (setq linum-relative-current-symbol "")
  :config
  (linum-relative-on))


;; line spacing
(setq-default line-spacing 8)


;; disable menu and toolbars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)


;; disable splash screen
(setq inhibit-splash-screen t)


;; line wrap settings
(global-visual-line-mode 1)
(global-linum-mode 1)


;; default fonts
(add-to-list 'default-frame-alist '(font . "Hack-10" ))
(set-face-attribute 'default t :font "Hack-10" )


(provide 'init-style)
