;; init-avy.el
;; sets up avy minor mode for jumping to characters


(use-package avy
  :ensure t
  :init
  (setq avy-timeout-seconds 0.3))


(provide 'init-avy)
