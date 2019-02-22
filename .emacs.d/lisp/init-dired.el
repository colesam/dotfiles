;; init-dired.el
;; setup dired settings 

(require 'dired)
(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)))

(define-key dired-mode-map (kbd "o") 'find-file-ace-window) ; see init-ace-window.el

(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header 
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))


(provide 'init-dired)
