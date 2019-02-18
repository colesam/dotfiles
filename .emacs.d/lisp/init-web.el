;; init-web.el
;; sets up web-mode package


(use-package web-mode
  :ensure t

  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-part-padding 0)

  :hook
  (web-mode . electric-pair-mode)
  (web-mode . emmet-mode)
  (web-mode . tern-mode)

  :mode 
  ("\\.html$" . web-mode)
  ("\\.php$" . web-mode)
  ("\\.vue$" . web-mode))


(provide 'init-web)
