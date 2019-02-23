;; init-scss.el
;; sets up scss minor mode


(use-package scss-mode
  :ensure t

  :init
  (setq scss-compile-at-save nil)
  (setq css-indent-offset 2)

  :mode
  ("\\.vue$" . scss-mode)
  ("\\.scss$" . scss-mode))


(provide 'init-scss)
