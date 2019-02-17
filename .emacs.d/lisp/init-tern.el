;; init-tern.el
;; sets up basic tern mode for JS interpretation

; See: http://ternjs.net/doc/manual.html#emacs
; Installation: run npm install -g tern
; Shortcuts:
;   M-. jump to definition
;   M-, go back
;   C-c C-r rename variable under the cursor
;   C-c C-c find the type of thing under the cursor

(use-package tern
  :ensure t)

; M-. conflicts with evil mode repeat, temporary fix until I feel I need vim's .
(define-key evil-normal-state-map (kbd "M-.") nil)


(provide 'init-tern)
