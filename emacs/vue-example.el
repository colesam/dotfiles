;; From this reddit thread: https://old.reddit.com/r/vuejs/comments/7dg1nb/how_do_you_set_up_emacs_to_develop_with_vue/

(add-to-list 'load-path "~/.emacs.d/lisp")
(defvar sr-speedbar-window nil)
(defvar *aquamacs-p* (boundp 'aquamacs-version))

;; macOS specific

(setq ns-pop-up-frames nil)

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "~/.emacs.d/exec-path-from-shell")
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GOOS")
  (exec-path-from-shell-copy-env "GOARCH")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "HGENCODING")

  (exec-path-from-shell-copy-env "DARCS_DONT_ESCAPE_8BIT")
  (exec-path-from-shell-copy-env "DARCS_DO_COLOR_LINES")

  ;(setq osx-key-mode nil)
  (setq mac-command-modifier 'meta
        mac-option-modifier nil
        ns-use-mac-modifier-symbols nil
        default-input-method "MacOSX")
)

;; maximized on init
(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(when (display-graphic-p)
  (tool-bar-mode -1)
  (setq scroll-bar-mode-explicit t) ;; get rid of the toolbar on top of the window
  (set-scroll-bar-mode `right)
  (normal-erase-is-backspace-mode 1))

(unless (display-graphic-p)
  (global-set-key "\C-h" 'backward-delete-char)
  (normal-erase-is-backspace-mode 0))


;; Font for OSX
(when (memq window-system '(mac ns))
  ;; Font for editor
  (set-default-font "Fira Mono-14")
  ;; Font for Speedbar
  (add-to-list 'default-frame-alist '(font . "Fira Mono-14"))
)

;; Font for FreeBSD / Linux
(unless (memq window-system '(mac ns))
  ;; Font for editor
  (set-default-font "Fira Mono-10")
  ;; Font for speedbar
  (add-to-list 'default-frame-alist '(font . "Fira Mono-10"))
)

(modify-frame-parameters nil '((wait-for-wm . nil)))

(setq-default tab-width 4)
(setq-default tab-stop-list (list 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108))
(define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop)
(setq-default indent-tabs-mode nil)

(set-default-coding-systems 'utf-8)
(set-language-environment "utf-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq mouse-drag-copy-region nil)
(global-set-key [mouse-2] '(lambda () (interactive) (popup-menu 'yank-menu)))
(global-set-key [mouse-3] 'buffer-menu)

(recentf-mode 1)
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq create-lockfiles nil)  ; don't create lockfiles

(require 'speedbar)
;;open speedbar at startup
;;(speedbar 1)
(setq speedbar-show-unknown-files t)

(setq column-number-mode t)
(show-paren-mode 1)

(cua-mode t)
(setq cua-enable-cua-keys nil) ;; Don't use c-x, c-c, c-v etc
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; default > 23
(setq cua-keep-region-after-copy t)
(setq cua-delete-selection t)

(delete-selection-mode 1)

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

;; Frame title bar formatting to show full path of file
(setq-default
 frame-title-format
 (list '((buffer-file-name "Emacs: %f" (dired-directory
	 			  dired-directory
				  (revert-buffer-function " %b"
				  ("Emacs: %b - Dir:  " default-directory)))))))

(setq-default
 icon-title-format
 (list '((buffer-file-name "Emacs: %f" (dired-directory
                  dired-directory
                  (revert-buffer-function " %b"
                  ("Emacs: %b - Dir:  " default-directory)))))))

;; Highlight current line
(global-hl-line-mode 1)

(global-set-key "\C-x\C-b" 'buffer-menu)

;; narrowing active
(put 'narrow-to-region 'disabled nil)


;; EDIFF
(require 'ediff)
(setq ediff-patch-options "-u")
;; turn off whitespace checking:
;; (setq ediff-diff-options "-w")
;; don't start another frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; put windows side by side
(setq ediff-split-window-function (quote split-window-horizontally))
;;revert windows on exit - needs winner mode
(winner-mode)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)
;;'(ediff-even-diff-A ((t (:background "turquoise4"))))


;; ispell setup
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=pt_PT"))
(global-set-key (kbd "M-4") 'ispell-word)

;; hippie expand
(global-set-key [remap dabbrev-expand] 'hippie-expand)


;; "smooth scrolling"
(setq scroll-step           1
      scroll-conservatively 10000)


; ############ conf made in EMACS settings ############
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(ansi-term-color-vector
   [unspecified "#1d2021" "#fb543f" "#95c085" "#fac03b" "#0d6678" "#8f4673" "#0d6678" "#a89984"] t)
 '(compilation-message-face (quote default))
 '(fci-rule-color "#202325" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors (quote ("#40883f" "#0287c8" "#b85c57")))
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (all-the-icons ac-emmet emmet-mode nord-theme vue-html-mode vue-mode rjsx-mode react-snippets elpy yasnippet-snippets rainbow-mode atom-one-dark-theme hasky-stack restclient flx-ido neotree company-distel haskell-snippets hasky-extensions shakespeare-mode scala-mode hi2 org-bullets intero org ac-octave projectile yasnippet yaml-mode web-mode tide tao-theme swift-mode sr-speedbar slime sass-mode racer python-django plan9-theme olivetti nginx-mode magit latex-preview-pane js2-mode jedi highlight-symbol go-errcheck go-eldoc go-dlv flymake-cursor flycheck-rust flatland-theme diff-hl dash-at-point darcsum csharp-mode coffee-mode cm-mode cargo buffer-move autopair auctex atom-dark-theme alchemist ahg)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values (quote nil))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(speedbar-supported-extension-expressions
   (quote
    (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".go")))
 '(vc-annotate-background "#1f2124")
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0000")
     (40 . "#ff4a52")
     (60 . "#f6aa11")
     (80 . "#f1e94b")
     (100 . "#f5f080")
     (120 . "#f6f080")
     (140 . "#41a83e")
     (160 . "#40b83e")
     (180 . "#b6d877")
     (200 . "#b7d877")
     (220 . "#b8d977")
     (240 . "#b9d977")
     (260 . "#93e0e3")
     (280 . "#72aaca")
     (300 . "#8996a8")
     (320 . "#afc4db")
     (340 . "#cfe2f2")
     (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3")
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 )



; ############ MINE!!!! ############


(setq backup-directory-alist '(("-autoloads\\.coffee\\'")
                               ("." . "~/.emacs.d/backups")))

; Para poder ver o simbolo do euro usando a fonte Droid ou outra com que o Emacs nao mostre
(when (display-graphic-p)
  (set-fontset-font "fontset-default" '(#x20ac . #x20ac) '("Menlo")))


(setq ring-bell-function 'ignore)


(global-set-key "\C-cy" '(lambda () (interactive) (popup-menu 'yank-menu)))


(define-key minibuffer-local-map
  [f3] (lambda () (interactive)
       (insert (buffer-name (current-buffer-not-mini)))))

(defun current-buffer-not-mini ()
  "Return current-buffer if current buffer is not the *mini-buffer*
  else return buffer before minibuf is activated."
  (if (not (window-minibuffer-p)) (current-buffer)
      (if (eq (get-lru-window) (next-window))
    	  (window-buffer (previous-window)) (window-buffer (next-window)))))

(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(global-set-key (kbd "C-x <left>") 'previous-user-buffer)
(global-set-key (kbd "C-x <right>") 'next-user-buffer)

(global-set-key (kbd "M-k") 'kill-whole-line)

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(global-set-key (kbd "C-\\") 'comment-or-uncomment-region)

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)

(global-set-key (kbd "S-C-w") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-h") 'shrink-window)


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


(require 'thingatpt)
(defun my-mark-current-word (&optional arg allow-extend)
    "Put point at beginning of current word, set mark at end."
    (interactive "p\np")
    (setq arg (if arg arg 1))
    (if (and allow-extend
             (or (and (eq last-command this-command) (mark t))
                 (region-active-p)))
        (set-mark
         (save-excursion
           (when (< (mark) (point))
             (setq arg (- arg)))
           (goto-char (mark))
           (forward-word arg)
           (point)))
      (let ((wbounds (bounds-of-thing-at-point 'word)))
        (unless (consp wbounds)
          (error "No word at point"))
        (if (>= arg 0)
            (goto-char (car wbounds))
          (goto-char (cdr wbounds)))
        (push-mark (save-excursion
                     (forward-word arg)
                     (point)))
        (activate-mark))))

(global-set-key (kbd "M-2") 'my-mark-current-word)

(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
         (read-string "Google: "))))))


; ############            ############
; ############  PACKAGES  ############
; ############            ############
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
; ############            ############


;; ;; linum-mode 
;; (global-linum-mode 1)
;; (setq linum-format " %d ")
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (ac-linum-workaround) ;; solve problem with auto-complete


; ############ DIFF-HL ############

;;(global-diff-hl-mode)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)


; ############ PROJECTILE ############

(projectile-mode)
;; (setq projectile-mode-line
;;          '(:eval (format " Projectile[%s]"
;;                         (projectile-project-name))))


; ############ ALL-THE-ICON (para NEOTREE) ############

(require 'all-the-icons)

; ############ NEOTREE ############


(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;(setq neo-window-fixed-size nil)
(setq neo-smart-open nil)
(setq neo-autorefresh nil)
(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir ()
    "Open NeoTree using the projectile."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find vc project root."))))

(defun neotree-size ()
  (interactive)
  (setq neo-window-width 35))

(global-set-key [f8] 'neotree-project-dir)
(global-set-key [(meta f8)] 'neotree-toggle)
(global-set-key [(ctrl f8)] 'neotree-size)
(global-set-key [(ctrl meta f8)] 'neotree-stretch-toggle)


; ############ SR-SPEEDBAR ############

;;(require 'sr-speedbar)
(setq sr-speedbar-default-width 30)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-auto-refresh nil)
(global-set-key (kbd "M-1") 'sr-speedbar-toggle)
(setq sr-speedbar-skip-other-window-p t)

(defadvice delete-other-windows (after my-sr-speedbar-delete-other-window-advice activate)
  "Check whether we are in speedbar, if it is, jump to next window."
  (let ()
	(when (and (fboundp 'sr-speedbar-window-exist-p) (sr-speedbar-window-exist-p sr-speedbar-window)
               (eq sr-speedbar-window (selected-window)))
      (other-window 1))))

(ad-enable-advice 'delete-other-windows 'after 'my-sr-speedbar-delete-other-window-advice)
(ad-activate 'delete-other-windows)

(add-hook 'speedbar-visiting-file-hook
          (lambda ()
            (interactive)
            (other-window 1)
            (nop)))


; ############ COLOR THEME ############

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq nord-region-highlight "snowstorm")
(setq nord-comment-brightness 15)
(load-theme 'nord t)


; ### FLYMAKE ###

(eval-after-load 'flymake '(require 'flymake-cursor))
(global-set-key [f5] 'flymake-goto-prev-error)
(global-set-key [f6] 'flymake-goto-next-error)
(setq flymake-cursor-auto-enable 1)


; ### Uniquify ###

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; ### IDO ###

;; FLX
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Standard IDO with Flex
;; (require 'ido)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (setq ido-max-directory-size 100000)
;; ;;(setq ido-use-filename-at-point 'guess)
;; (setq ido-use-filename-at-point nil)
;; (ido-mode 1)


; ############ AUTOPAIR ############

(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers

; ############ HIGHTLIGHT-SYMBOL ############

(require 'highlight-symbol)
(global-set-key [(control f7)] 'highlight-symbol-at-point)
(global-set-key [f7] 'highlight-symbol-next)
(global-set-key [(shift f7)] 'highlight-symbol-prev)
(global-set-key [(meta f7)] 'highlight-symbol-query-replace)


; ############ BUFFER MOVE ############

(require 'buffer-move)

(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)


; ############ MERCURIAL ############

(require 'ahg)

; ############ GIT ############

(require 'magit)

; ############ DARCS ###########

;; vc-darcs
(add-to-list 'load-path "~/.emacs.d/vc-darcs/")
(require 'vc-darcs)

;; darcsum
(set-variable 'darcsum-program "~/.local/bin/darcs")
(setq darcsum-whatsnew-switches "-l")
(require 'darcsum)

; ############ TRAMP ############

(require 'tramp)
(require 'tramp-cmds)

(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

; ############ YASNIPPET  ############

(require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/yasnippet-go"
;;         "~/.emacs.d/yasnippet-snippets"
;;         ))
(yas/global-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)

; ############ ANGULAR.JS - SNIPPETS  ############

;; (require 'angular-snippets)

; ############ ORG-MODE ############

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(setq org-log-done t)

(setq org-directory "~/Documents/org-mode")
(setq org-agenda-files (list "~/Documents/org-mode/" "~/Dropbox/Org-Mode/" "~/Dropbox/Org-Mode/Projects"))
(setq org-default-notes-file (concat org-directory "/refile.org"))

(setq org-todo-keywords
      '((sequence "TODO(t)" "ONGOING(o)" "TEST(s)" "FEEDBACK(f)" "VERIFY(v)" "|" "DONE(d)" "POSTPONED(n)" "DELEGATED(g)")
       (sequence "BUG(b)" "PROPOSAL(p)" "ENHANCEMENT(e)" "|" "FIXED(x)" "WONTFIX(w)" "INVALID(i)")))
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "royal blue" :weight bold)
              ("ONGOING" :foreground "DodgerBlue1" :weight bold)
              ("TEST" :foreground "turquoise4" :weight bold)
              ("FEEDBACK" :foreground "firebrick" :weight bold)
              ("VERIFY" :foreground "dark orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("DELEGATED" :foreground "forest green" :weight bold)
              ("POSTPONED" :foreground "orange" :weight bold)

              ("BUG" :foreground "red" :weight bold)
              ("PROPOSAL" :foreground "yellow" :weight bold)
              ("ENHANCEMENT" :foreground "magenta" :weight bold)
              ("FIXED" :foreground "forest green" :weight bold)
              ("WONTFIX" :foreground "forest green" :weight bold)
              ("INVALID" :foreground "forest green" :weight bold)

              (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("@computer" . ?c) ("@phone" . ?f) ("errand" . ?e))))))


; Refile settings
; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
; Stop using paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)
; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)
; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))
; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)

; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(setq org-capture-templates
      (quote (("t" "TODO" entry (file "~/Documents/org-mode/refile.org")
               "* TODO %?\n%U\n%a\n  %i")
              ("n" "Note" plain (file+headline "~/Documents/org-mode/notas.org" "Notas")
               "%? :NOTE:\n%U\n%a\n  %i" :empty-lines 1)
              ("p" "Phone Call" entry (file "~/Documents/org-mode/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("i" "Interruption" entry (file "~/Documents/org-mode/refile.org")
               "* INTERRUPTION %? :INTERRUPTION:\n%U" :clock-in t :clock-resume t)
              ("w" "Work" entry (file "~/Documents/org-mode/refile.org")
               "* WORK %? :NEVEDA:\n%U" :clock-in t :clock-resume t)
              ("b" "Bookmark" entry (file+headline "~/Dropbox/Org-Mode/bookmarks.org" "Bookmarks")
               "* %:description \n %:link \n\n %i" :empty-lines 1))))

(setq org-agenda-custom-commands
      '(("|" "MobileOrg"
         ((agenda)
          (alltodo)))))

(setq org-mobile-agendas (quote ("|")))

(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . nil)
        (sql . t)))


;; ORG-MOBILE

(setq org-mobile-inbox-for-pull "~/Documents/org-mode/flagged.org")
(setq org-mobile-directory "~/Dropbox/Aplicativos/MobileOrg")
(setq org-mobile-files (quote ("~/Documents/org-mode")))
(setq org-mobile-force-id-on-agenda-items nil)

(require 'org-feed)

(setq org-feed-alist
          '(("Wrike"
              "https://www.wrike.com/rss/8dbb1e26d7a74dacba355a7d60fb0fb1"
              "~/Documents/org-mode/wrike.org" "Wrike Entries"
              :parse-feed org-feed-parse-atom-feed)))


;; ORG-PROTOCOL

(server-start)
(require 'org-protocol)

;; ORG - bullets
;;(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

; ############ TEX-LIVE ############

;;(require 'org-latex)

;;(setq latex-run-command "xelatex")
;;(setq-default TeX-engine 'xetex)
;;(setq-default TeX-PDF-mode t)

(setq pdf-latex-command "xelatex")

; ############ Dart ############

;;(require 'dart-mode)
(setq dart-executable-path "~/Development/tools/dart-sdk/bin/dart")
(setq dart-enable-analysis-server t)
(add-hook 'dart-mode-hook 'flycheck-mode)

; ############ Coffeescript ############

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(require 'coffee-mode)
(setq coffee-indent-like-python-mode t)
(setq coffee-tab-width 2)

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

(defun coffee-custom ()
  "coffee-mode-hook"
  (flycheck-mode)
  (imenu-add-menubar-index)
  (whitespace-mode)
  (setq flycheck-coffeelintrc "~/.emacs.d/coffeelint.json")
  (make-local-variable 'tab-width)
  (set 'tab-width 2))

(add-hook 'coffee-mode-hook 'coffee-custom)

; ############ LESS ############

(setq less-css-lessc-command "/usr/local/bin/lessc")
(require 'less-css-mode)

; ############ SASS ############

(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

; ############ Apache  ############

(require 'apache-mode)

; ############ PYTHON SUPPORT ############

(defun python-autopep8 ()
  "Automatically formats Python code to conform to the PEP 8 style guide."
  (interactive)
  (when (eq major-mode 'python-mode)
    (shell-command
     (format "~/Development/emacs_vv3/bin/autopep8 --in-place --aggressive --max-line-length 300 %s"
             (shell-quote-argument (buffer-file-name))))
    (revert-buffer t t t)))

(elpy-enable)
;;(setq elpy-rpc-python-command "~/Development/emacs_virtualenv/bin/python")
(setq elpy-rpc-python-command "~/Development/emacs_vv3/bin/python3")
(elpy-use-cpython "/usr/local/bin/python3")
(elpy-use-ipython "ipython3")
(setq elpy-rpc-backend "jedi")

(add-hook 'elpy-mode-hook
          (lambda ()
            (setq ac-modes (delq 'python-mode ac-modes))
            (highlight-indentation-mode -1)
            (local-unset-key (kbd "M-TAB"))
            (define-key elpy-mode-map (kbd "<f5>") 'elpy-company-backend)))

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-8") 'python-autopep8)
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)
            (imenu-add-menubar-index)
            (autopair-mode)
            (setq python-shell-interpreter "ipython3" python-shell-interpreter-args "--simple-prompt --pprint")
            ;; (setq python-shell-interpreter "ipython3" python-shell-interpreter-args "-i")
            ;; (setenv "IPY_TEST_SIMPLE_PROMPT" "1")
            (set-variable 'py-indent-offset 4)
            (set-variable 'indent-tabs-mode nil)
            (load-library "rfringe")

            (defun annotate-todo ()
              "put fringe marker on TODO: lines in the curent buffer"
              (interactive)
              (save-excursion
                (goto-char (point-min))
                (while (re-search-forward "\\<\\(FIXME\\|TODO\\|BUG\\):" nil t)
                  (let ((overlay (make-overlay (- (point) 5) (point))))
                    (overlay-put overlay 'before-string (propertize "A"
                                                                    'display '(left-fringe right-triangle)))))))
            (add-hook 'find-file-hooks 'annotate-todo)

            ))


; ############ Django ############

(require 'python-django)

; ############ Google GO ############

(require 'go-dlv)

;;(require 'go-mode-autoloads)

(add-hook 'before-save-hook 'gofmt-before-save)

(eval-after-load "go-mode"
  '(progn
     (add-to-list 'load-path "~/Development/go-lib/src/github.com/nsf/gocode/emacs")
     (require 'auto-complete-config)
     (ac-config-default)
     ;; Show 0.8 second later
     (setq ac-auto-show-menu 2)
     (require 'go-autocomplete)

     (define-key go-mode-map (kbd "RET") #'go-mode-insert-and-indent)

     (add-to-list 'load-path "~/Development/go-lib/src/github.com/dougm/goflymake")
     (require 'go-flymake)

     (require 'go-errcheck)

     (require 'go-eldoc)

     ;; guru settings
     (go-guru-hl-identifier-mode)                    ; highlight identifiers

     (require 'go-guru)))

(add-hook
 'go-mode-hook
 '(lambda ()

    ; Use goimports instead of go-fmt
    (setq gofmt-command "goimports")
    ; Call Gofmt before saving
    (add-hook 'before-save-hook 'gofmt-before-save)

    (go-eldoc-setup)

    (autopair-mode)

    (go-eldoc-setup)

    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
    (local-set-key (kbd "C-c i") 'go-goto-imports)

    ;; Imenu & Speedbar

    (setq imenu-generic-expression
          '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
            ("func" "^func *\\(.*\\) {" 1)))
    (imenu-add-to-menubar "Index")

    ;; Outline mode

    (make-local-variable 'outline-regexp)
    (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
    (outline-minor-mode 1)
    (local-set-key "\M-a" 'outline-previous-visible-heading)
    (local-set-key "\M-e" 'outline-next-visible-heading)

    ;; Menu bar

    (require 'easymenu)
    (defconst go-hooked-menu
      '("Go tools"
        ["Set GOPATH from file" set-go-path-from-file t]
        ["Go run buffer" go t]
        ["Go reformat buffer" go-fmt-buffer t]
        ["Go check buffer" go-fix-buffer t]))
    (easy-menu-define
      go-added-menu
      (current-local-map)
      "Go tools"
      go-hooked-menu)

    ;; Other

    (setq tab-width 8)
    (setq indent-tabs-mode t)
    ;;    (setq show-trailing-whitespace t)

    (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))

))

;; helper function
(defun set-go-path-from-file ()
  (interactive)
  (setenv "GOPATH" (substring buffer-file-name 0 (search "/src" buffer-file-name))))

;; helper function
(defun go ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " buffer-file-name)))

;; helper function
(defun go-fmt-buffer ()
  "run gofmt on current buffer"
  (interactive)
  (if buffer-read-only
    (progn
      (ding)
      (message "Buffer is read only"))
    (let ((p (line-number-at-pos))
	  (filename (buffer-file-name))
	  (old-max-mini-window-height max-mini-window-height))
      (show-all)
      (if (get-buffer "*Go Reformat Errors*")
	  (progn
	    (delete-windows-on "*Go Reformat Errors*")
	    (kill-buffer "*Go Reformat Errors*")))
      (setq max-mini-window-height 1)
      (if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t))
	  (progn
	    (erase-buffer)
	    (insert-buffer-substring "*Go Reformat Output*")
	    (goto-char (point-min))
	    (forward-line (1- p)))
	(with-current-buffer "*Go Reformat Errors*"
	  (progn
	    (goto-char (point-min))
	    (while (re-search-forward "<standard input>" nil t)
	      (replace-match filename))
	    (goto-char (point-min))
	    (compilation-mode))))
      (setq max-mini-window-height old-max-mini-window-height)
      (delete-windows-on "*Go Reformat Output*")
      (kill-buffer "*Go Reformat Output*"))))

;; helper function
(defun go-fix-buffer ()
  "run gofix on current buffer"
  (interactive)
  (show-all)
  (shell-command-on-region (point-min) (point-max) "go tool fix -diff"))



; ############ SLIME ############


(setq slime-net-coding-system 'utf-8-unix)

; para Clozure CL
(setq inferior-lisp-program "~/bin/ccl -K utf-8")
(setq slime-contribs '(slime-fancy slime-repl slime-asdf slime-indentation slime-banner))
(setq common-lisp-hyperspec-root "file:~/Development/docs/lisp/CLHS7/HyperSpec/")

; SBCL
;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; slime-sbcl-exts no slime-setup

; ABCL
;(setq inferior-lisp-program "java -jar /Users/pbeck/Development/tools/abcl/abcl.jar")

; ALLEGRO CL
;(setq inferior-lisp-program "/usr/local/acl81_express/alisp")


; ############ Octave ############

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;;(autoload 'run-octave "octave-inf" nil t)

(require 'ac-octave)
(defun ac-octave-mode-setup ()
  (setq ac-sources '(ac-source-octave)))
  (add-hook 'octave-mode-hook
    '(lambda () (ac-octave-mode-setup)))

(add-hook 'octave-mode-hook
          (lambda ()
            (set (make-local-variable 'tab-width) 4)
            (abbrev-mode 1)
            ;; (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

(add-hook 'inferior-octave-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (define-key inferior-octave-mode-map [up]
              'comint-previous-input)
            (define-key inferior-octave-mode-map [down]
              'comint-next-input)))


; ############ Maxima ############

;(add-to-list 'load-path "/Applications/Maxima.app/Contents/Resources/maxima/share/maxima/5.25.1/emacs")
(add-to-list 'load-path "~/bin/maxima-5.29.1/interfaces/emacs/emaxima")

(setq auto-mode-alist (cons '("\\.max" . maxima-mode) auto-mode-alist))
(autoload 'maxima "maxima" "Running Maxima interactively" t)
(autoload 'maxima-mode "maxima" "Maxima editing mode" t)

;(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
;(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
;(setq imaxima-use-maxima-mode-flag t)

(setq maxima-info-dir "~/bin/maxima-5.29.1/doc/info")

; ############ SWIFT SUPPORT ############

(require 'swift-mode)

; ############ HASKELL ###########

(speedbar-add-supported-extension ".hs")

(add-hook 'haskell-mode-hook
          '(lambda ()
             (define-key haskell-mode-map "\C-ch" 'haskell-hoogle)
             ;(setq haskell-hoogle-command "hoogle")
             (imenu-add-menubar-index)))

(add-hook 'haskell-mode-hook 'intero-mode)

; ########### Java ################

(defun my-java-flymake-init ()
  (setq flymake-gui-warnings-enabled nil)
  (list "javac" (list (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-with-folder-structure))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.java$" my-java-flymake-init flymake-simple-cleanup))

(add-hook 'java-mode-hook
          '(lambda ()
             (flymake-mode t)))

; ########### YAML ################

;;(add-to-list 'load-path "~/.emacs.d/yaml-mode")
;;(require 'yaml-mode)
;;(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


; ########### PASCAL ################
; http://www.nada.kth.se/~inge/MY/pascal/

(add-to-list 'load-path "~/.emacs.d/pasc-mode")
(add-to-list 'auto-mode-alist '("\\.pas$" . pascal-mode))
(autoload 'pascal-mode "pasc-mode" "Pascal Mode." t)


; ########### EMMET-MODE ################

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-html-mode-hook)
(add-hook 'html-mode-hook 'emmet-html-mode-hook)
(add-hook 'css-mode-hook 'emmet-css-mode-hook)

(defun emmet-html-mode-hook ()
  (emmet-mode)
  (ac-emmet-html-setup))

(defun emmet-css-mode-hook ()
  (emmet-mode)
  (ac-emmet-css-setup))


; ########### CSS ################

(add-hook 'css-mode-hook 'rainbow-mode)

; ########### WEB-MODE ################

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gotmpl\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))


(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'")
        ("go"        . "\\.gotmpl\\'")))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (require 'auto-complete-config)
  (ac-config-default)
  ;; Show 0.8 second later
  (setq ac-auto-show-menu 2)

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
  ;;  (setq web-mode-enable-auto-indentation t)
  ;;  (setq web-mode-indent-style 2)
  (setq web-mode-enable-auto-indentation nil)

  (emmet-html-mode-hook)

  (rainbow-mode)

  (autopair-mode 1))

(add-hook 'web-mode-hook 'web-mode-hook)


; ########### HTML ################

(defun flymake-html-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "tidy" (list local-file))))


(when (load "flymake" t)
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.html$\\|\\.ctp" flymake-html-init))

  (add-to-list 'flymake-err-line-patterns
               '("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)"
                 nil 1 2 4)))

(add-hook 'html-mode-hook
          '(lambda ()
             (setq flymake-gui-warnings-enabled nil)))


; ############ JAVASCRIPT SUPPORT ############

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
;; (setq js2-mode-show-parse-errors nil)
;; (setq js2-mode-show-strict-warnings nil)
(setq js2-strict-missing-semi-warning nil)

(add-to-list 'load-path "~/Development/tools/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

(require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")

(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
                                                 (replace-regexp-in-string ".*1G.*3G" "> " output))))))


(add-hook 'js2-mode-hook
          '(lambda ()
             (tern-mode t)
             (flymake-mode t)

             (setq js2-basic-offset 4)
             (setq js2-bounce-indent-p t)

             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             (local-set-key "\C-cb" 'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-cl" 'js-load-file-and-go)))


(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "python -mjson.tool" (current-buffer) t)))

(define-key json-mode-map (kbd "C-c C-b") 'beautify-json)


; ############ DASH SUPPORT ############
;; instalado nas packages

(global-set-key "\C-cx" 'dash-at-point)
(global-set-key "\C-cz" 'zeal-at-point)

; ############ TYPESCRIPT SUPPORT ############

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq typescript-indent-level 4)
  (imenu-add-menubar-index)
  (local-set-key (kbd "C-c C-d") 'tide-documentation-at-point)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

;; Tide can be used along with web-mode to edit tsx files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (company-mode))))


; ############ RUST ############

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (flycheck-mode +1)
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "~/Development/tools/rust/src") ;; Rust source code PATH

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

; ############ ELIXIR ############

(require 'alchemist)

(add-to-list 'elixir-mode-hook
             (lambda ()
               (autopair-mode)
               (company-mode)))


; ############ ERLANG ############

;; (setq load-path (cons "/usr/local/Cellar/erlang/20.0/lib/erlang/lib/tools-2.9/emacs" load-path))
(require 'erlang-start)
(setq erlang-root-dir "/usr/local/lib/erlang/")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(setq erlang-man-root-dir "/usr/local/lib/erlang/man")


(defun init_erlang()
  (require 'flycheck)

  (flycheck-define-checker erlang-otp
    "An Erlang syntax checker using the Erlang interpreter."
    :command ("erlc" "-o" temporary-directory "-Wall"
              "-I" "../include" "-I" "../../include"
              "-I" "../../../include" source)
    :modes (erlang-mode)
    :error-patterns
    ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
     (error line-start (file-name) ":" line ": " (message) line-end)))


  (push "~/.emacs.d/distel/elisp/" load-path)
  (require 'distel)
  (distel-setup)

  ;; prevent annoying hang-on-compile
  (defvar inferior-erlang-prompt-timeout t)
  ;; default node name to emacs@localhost
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  ;; tell distel to default to that node
  (setq erl-nodename-cache
        (make-symbol
         (concat
          "emacs@"
          ;; Mac OS X uses "name.local" instead of "name", this should work
          ;; pretty much anywhere without having to muck with NetInfo
          ;; ... but I only tested it on Mac OS X.
          (car (split-string (shell-command-to-string "hostname"))))))

  ;; (push "~/.emacs.d/company-distel/" load-path)
  (require 'company-distel)
  ;; (with-eval-after-load 'company
  ;;   (add-to-list 'company-backends 'company-distel))
  (setq company-backends '(company-distel))

  (add-hook 'erlang-mode-hook
            (lambda ()
              (company-mode)
              (flycheck-select-checker 'erlang-otp)
              (flycheck-mode)))

  (remove-hook 'erlang-mode-hook 'init_erlang))


(add-hook 'erlang-mode-hook 'init_erlang)