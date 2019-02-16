;; init-web.el
;; sets up web-mode package


(use-package web-mode
  :ensure t
  :init
  (setq web-mode-code-indent-offset 2)
  :hook (web-mode . electric-pair-mode)
  :mode 
  ("\\.html$" . web-mode)
  ("\\.php$" . web-mode)
  ("\\.vue$" . web-mode))


(provide 'init-web)
