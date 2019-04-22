;; init-rust.el
;; setup tooling for rust


(use-package racer
  :ensure t
  :init
  (setq racer-cmd "~/.cargo/bin/racer")
  (setq racer-rust-src-path "~/Documents/code/rust"))

;; Lets you run cargo commands
;; C-c C-c C-b   build
;; C-c C-c C-r   run
;; C-c C-c C-t   test
(use-package cargo
  :ensure t)

(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (add-hook 'rust-mode-hook
	    (lambda()
	      (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'rust-mode-hook #'flycheck-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(provide 'init-rust)
