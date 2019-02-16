(setq debug-on-error t) ; produce backtraces when errors occur
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; auto load from .emacs.d/lisp directory


(require 'init-elpa)
(require 'init-style)

;; General Packages
(require 'init-key-chord)
(require 'init-ace-jump)
(require 'init-org)
(require 'init-evil)

;; Web Development Packages
(require 'init-web)
