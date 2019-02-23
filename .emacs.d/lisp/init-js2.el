;; init-js2.el
;; set up js2-mode


(use-package js2-mode
  :ensure t

  :init
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-pretty-multiline-declarations 'dynamic)

  :hook
  (js2-mode . tern-mode)
  (js2-mode . electric-pair-mode)
  (js2-mode . (lambda()
		(setq evil-shift-width 2)))

  :mode ("\\.js$" . js2-mode))


(provide 'init-js2)
