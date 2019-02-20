;; init-multi-term.el
;; set up multi-term major mode


(use-package multi-term
  :ensure t
  :init
  (setq multi-term-program "/bin/bash")
  :config
  (add-to-list 'term-unbind-key-list "M-o"))

; hack to get M-o to work in multi-term
(add-hook 'term-mode-hook (lambda()
			    (define-key term-raw-map (kbd "M-o") 'ace-window)))


(provide 'init-multi-term)
