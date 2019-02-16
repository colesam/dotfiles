;; init-key-chord.el
;; initializes key chord basic settings


(use-package key-chord
  :ensure t
  :init
  (setq key-chord-two-keys-delay 0.5)
  :config
  (key-chord-mode t))


(provide 'init-key-chord)
