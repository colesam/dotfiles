(package-initialize) ; required by package.el

(setq default-directory "~/")

(setq debug-on-error t) ; produce backtraces when errors occur
(global-auto-revert-mode t)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; auto load from .emacs.d/lisp directory
(global-set-key (kbd "C-s") 'save-buffer) 

;; Put backup files in own directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; don't delink hardlinks
  version-control t      ; use version numbers on backups
  delete-old-versions t  ; automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; how many of the old
)

;; General Packages
(require 'init-elpa)
(require 'init-style)
(require 'init-avy)
(require 'init-ace-window)
(require 'init-key-chord)
(require 'init-org)
(require 'init-evil)
(require 'init-dired)
