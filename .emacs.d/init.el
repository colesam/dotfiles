;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(setq debug-on-error t) ; produce backtraces when errors occur
(global-auto-revert-mode t)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; auto load from .emacs.d/lisp directory


;; Put backup files in own directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


(require 'init-elpa)
(require 'init-style)


;; General Packages
(require 'init-avy)
(require 'init-ace-window)
(require 'init-multi-term)
(require 'init-key-chord)
(require 'init-org)
(require 'init-evil)
(require 'init-dired)


;; Web Development Packages
(require 'init-web)
(require 'init-emmet)
(require 'init-js2)


;; Auto Completion
(require 'init-tern)
(require 'init-company)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" default)))
 '(package-selected-packages
   (quote
    (multi-term avy web-mode use-package solarized-theme scss-mode org-bullets linum-relative key-chord js2-mode evil-org emmet-mode company-tern ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:family "Hack"))))
 '(org-level-1 ((t (:family "Hack"))))
 '(org-level-2 ((t (:family "Hack"))))
 '(org-level-3 ((t (:family "Hack"))))
 '(org-level-4 ((t (:family "Hack"))))
 '(org-level-5 ((t (:family "Hack"))))
 '(org-level-6 ((t (:family "Hack"))))
 '(org-level-7 ((t (:family "Hack"))))
 '(org-level-8 ((t (:family "Hack")))))
