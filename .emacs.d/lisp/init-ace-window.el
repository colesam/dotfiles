;; init-ace-window.el
;; sets up ace-window command for switching windows easily

;; Useful commands (append after M-o):
;;    x - delete window
;;    m - swap windows
;;    M - move window
;;    c - copy window
;;    j - select buffer
;;    n - select the previous window
;;    u - select buffer in the other window
;;    c - split window fairly, either vertically or horizontally
;;    v - split window vertically
;;    b - split window horizontally
;;    o - maximize current window
;;    ? - show these command bindings

;; git submodule: https://github.com/abo-abo/ace-window.git 
(add-to-list 'load-path "~/.emacs.d/plugins/ace-window/")

; init
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)) ; set switch keys to home row instead of nums

(require 'ace-window)
; config
(global-set-key (kbd "M-o") 'ace-window)


(provide 'init-ace-window)
