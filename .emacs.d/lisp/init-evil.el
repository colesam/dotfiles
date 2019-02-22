;; init-evil.el
;; initializes emacs evil and evil org modes


(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package evil-org
  :ensure t
  :hook (org-mode . evil-org-mode))


;; key bindings
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char-timer)


(provide 'init-evil)
