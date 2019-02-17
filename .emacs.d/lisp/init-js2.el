;; init-js2.el
;; set up js2-mode


(use-package js2-mode
  :ensure t

  :init
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)

  :mode ("\\.js$" . js2-mode))


(provide 'init-js2)
