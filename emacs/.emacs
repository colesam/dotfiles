(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t))
(package-initialize)

;; Straight Use Package Bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(straight-use-package '(mmm-mode :host github :repo "purcell/mmm-mode"))

;; Package Auto Installations
(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :init
  (evil-mode))

(use-package evil-org
  :ensure t)

(use-package vue-mode
  :ensure t)

(use-package vue-html-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package mmm-mode
  :ensure t)

(use-package emmet-mode
  :ensure t)

(use-package js2-mode
  :ensure t)

(use-package tern
  :ensure t)

(use-package scss-mode
  :ensure t
  :init
  (setq scss-compile-at-save nil))

(use-package company
  :ensure t)

(use-package company-tern
  :ensure t)

(use-package linum-relative
  :ensure t)

(use-package ace-jump-mode
  :ensure t)

(use-package key-chord
  :ensure t
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode t))


;; ##### General Auto-Complete #####
(setq company-idle-delay t)
(global-company-mode t)


;; ##### SCSS #####
(add-to-list 'auto-mode-alist '("\\.scss" . scss-mode))


;; ##### Emmet #####
(add-hook 'sgml-mode-hook 'emmet-html-mode-hook)
(add-hook 'html-mode-hook 'emmet-html-mode-hook)
(add-hook 'css-mode-hook 'emmet-css-mode-hook)

(defun emmet-html-mode-hook ()
  (emmet-mode)
  (ac-emmet-html-setup))

(defun emmet-css-mode-hook ()
  (emmet-mode)
  (ac-emmet-css-setup))


;; ##### Web Mode #####
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gotmpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))


;; ##### JavaScript #####
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-strict-missing-semi-warning nil)

;; Tern Mode
; See: http://ternjs.net/doc/manual.html#emacs
; Installation: run npm install -g tern
; Shortcuts:
;   M-. jump to definition
;   M-, go back
;   C-c C-r rename variable under the cursor
;   C-c C-c find the type of thing under the cursor

; M-. conflicts with evil mode repeat, temporary fix until I feel I need vim's .
(define-key evil-normal-state-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook
          '(lambda ()
		(tern-mode t)
		(electric-pair-mode t)

		(setq js2-basic-offset 4)
		(setq js2-bounce-indent-p t)))

(add-to-list 'company-backends 'company-tern)


;; Ace Jump Mode
(autoload
 	'ace-jump-mode
	"ace-jump-mode"
	"Emacs quick move minor mode"
	t)


;; Evil Org Mode (pulled manually with git)
;; https://github.com/Somelauw/evil-org-mode.git 
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;; line wrap
(global-visual-line-mode 1)
(global-linum-mode 1)
(linum-relative-on)
(setq linum-relative-current-symbol "")

(setq indent-tabs-mode t)
(setq tab-width 4)

;; theme
(setq solarized-scale-org-headlines nil)
(load-theme 'solarized-dark t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; org-mode bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it again, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(setq org-startup-indented t)
(require 'org)
;; Make Org mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))

(setq org-todo-keyword-faces
 	'(
		("IN-PROGRESS" . (:foreground "yellow" :weight bold))
		("READY" . (:foreground "orange" :weight bold))
	))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (sass-mode tern emmet-mode web-mode vue-mode vue-html-mode linum-relative ace-jump-mode key-chord evil use-package js3-mode solarized-theme ## js2-mode))))


(custom-theme-set-faces
   'user
   `(org-level-1 ((t (:family "Hack"))))
   `(org-level-2 ((t (:family "Hack"))))
   `(org-level-3 ((t (:family "Hack"))))
   `(org-level-4 ((t (:family "Hack"))))
   `(org-level-5 ((t (:family "Hack"))))
   `(org-level-6 ((t (:family "Hack"))))
   `(org-level-7 ((t (:family "Hack"))))
   `(org-level-8 ((t (:family "Hack"))))
   `(org-document-title ((t (:family "Hack")))))


(add-to-list 'default-frame-alist '(font . "Hack" ))
(set-face-attribute 'default t :font "Hack" )
