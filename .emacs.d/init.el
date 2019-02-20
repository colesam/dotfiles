;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(setq debug-on-error t) ; produce backtraces when errors occur
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
(require 'init-ace-window)
(require 'init-multi-term)
(require 'init-key-chord)
(require 'init-ace-jump)
(require 'init-org)
(require 'init-evil)


;; Web Development Packages
(require 'init-web)
(require 'init-emmet)
(require 'init-js2)


;; Auto Completion
(require 'init-tern)
(require 'init-company)

