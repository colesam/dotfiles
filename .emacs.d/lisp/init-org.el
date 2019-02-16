;; init-org.el
;; initializes org-mode settings


(use-package org
  :ensure t
  :init
  (setq org-startup-indented t)
  :mode ("\\.org$" . org-mode))


;; org-mode fonts
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


;; org-mode todo keywords and keyword faces
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))

(setq org-todo-keyword-faces
      '(("IN-PROGRESS" . (:foreground "yellow" :weight bold))
	("READY" . (:foreground "orange" :weight bold))))
	

(provide 'init-org)
