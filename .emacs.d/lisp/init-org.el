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
   `(org-level-1 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-level-2 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-level-3 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-level-4 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-level-5 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-level-6 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-level-7 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-level-8 ((t (:family "Source Code Pro Semibold-10"))))
   `(org-document-title ((t (:family "Source Code Pro Semibold-10")))))


;; org-mode todo keywords and keyword faces
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#83a598" :weight bold))
	("IN-PROGRESS" . (:foreground "#fabd2f" :weight bold))
	("STARTED" . (:foreground "#fabd2f" :weight bold))
	("FOLLOW-UP" . (:foreground "#6ebb26" :weight bold))
	("LOW-PRIORITY" . (:foreground "#a89984" :weight bold))
	("ON-HOLD" . (:foreground "#a89984" :weight bold))
	("READY" . (:foreground "#fe8019" :weight bold))
	("DONE" . (:foreground "#98971a" :weight bold))
	("DEPLOYED" . (:foreground "#98971a" :weight bold))
	("UI-READY" . (:foreground "#ff850b" :weight bold))
	("PRO" . (:foreground "#b8bb26" :weight bold))
	("CON" . (:foreground "#fb4933" :weight bold))))
	

(provide 'init-org)
