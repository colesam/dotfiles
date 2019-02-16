(setq debug-on-error t) ; produce backtraces when errors occur
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; auto load from .emacs.d/lisp directory


(require 'init-elpa)
(require 'init-style)

(require 'init-key-chord)
(require 'init-ace-jump)
(require 'init-org)
(require 'init-evil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (key-chord use-package solarized-theme org-bullets linum-relative evil-org ace-jump-mode))))
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
