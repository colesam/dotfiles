;; init-company.el
;; sets up company mode and related backends


(use-package company
  :ensure t

  :init
  (setq company-idle-delay t)

  :config
  (global-company-mode t))

(use-package company-tern
  :ensure t

  :config
  (add-to-list 'company-backends 'company-tern))


(provide 'init-company)
