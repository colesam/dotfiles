;; init-ess.el
;; sets up emacs speaks statistics package

(use-package ess
  :ensure t
  :init
  (require 'ess-site))

(provide 'init-ess)
