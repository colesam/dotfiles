;; init-web.el
;; sets up web-mode package


(use-package web-mode
  :ensure t
  :mode 
  ("\\.html$" . web-mode)
  ("\\.php$" . web-mode)
  ("\\.vue$" . web-mode))


(provide 'init-web)
