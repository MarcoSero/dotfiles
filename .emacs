(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Essentials
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq scroll-step 1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(global-linum-mode t)
(setq backup-directory-alist `(("." . "~/.Trash")))
(setq frame-title-format "%b")
(setq ring-bell-function 'ignore)
(desktop-save-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(line-number-mode 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
(setq-default cursor-type 'bar) 

(require 'whitespace)
(setq whitespace-line-column 100)
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font and style
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (load-theme 'spacegray t)
; (load-theme 'base16-ocean t)
; (load-theme 'aurora t)
(load-theme 'atom-one-dark t)

(custom-set-faces
 '(default ((t (:family "Source Code Pro for Powerline" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(mode-line ((t (:foreground "#2B303B" :background "#B48EAD" :box nil))))
 '(mode-line-inactive ((t (:foreground "#2B303B" :background "#A7ADBA" :box nil)))))

(custom-set-variables
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

; Show line numbers, dynamically with spaces on either side:
(global-linum-mode 1)
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

; Highlight the current line number (requires hlinum):
(require 'hlinum)
(hlinum-activate)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Powerline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (require 'powerline)
; (powerline-center-evil-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm & projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-buffers-fuzzy-matching t)
(setq helm-M-x-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-recentf-fuzzy-match t)
(setq helm-locate-fuzzy-match t)
(setq helm-file-cache-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
(setq helm-completion-in-region-fuzzy-match t)
(setq helm-mode-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Projectile
(projectile-global-mode)
; disable fuzzy match to avoid searching directories
; (setq helm-projectile-fuzzy-match nil)
(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; evil
(require 'evil)
(evil-mode t)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("red" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("green" bar))
(setq evil-replace-state-cursor '("green" bar))
(setq evil-operator-state-cursor '("green" hollow))

(define-key evil-motion-state-map ";" 'evil-ex)
(setq evil-move-cursor-back nil)

; Leader
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key (kbd "h") 'projectile-find-other-file)
(evil-leader/set-key (kbd "o") 'projectile-find-file)
; copy and paste from clipboard
(evil-leader/set-key (kbd "p") 'clipboard-yank)
(evil-leader/set-key (kbd "d") 'clipboard-kill-region)
(evil-leader/set-key (kbd "y") 'clipboard-kill-ring-save)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; ycmd
(require 'ycmd)
(defconst google-ycmd--extra-conf "~/code/google3/googlemac/iPhone/Timely/.ycm_extra_conf.py")
(set-variable 'ycmd-server-command '("python" "/Users/msero/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
(setq ycmd-global-config google-ycmd--extra-conf)
(add-to-list 'ycmd-extra-conf-whitelist google-ycmd--extra-conf)

(add-hook 'after-init-hook 'global-company-mode)
(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'ycmd-mode)

;; 'company-clang' does not work in google3; we do not want company to ever
;; fall back to it.
(delq 'company-clang company-backends)

;; Autocomplete
; (require 'auto-complete-config)
; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
; (ac-config-default)
; (ac-set-trigger-key "TAB")
; (setq ac-use-menu-map t)
; (define-key ac-completing-map "\t" 'ac-complete)
; (define-key ac-completing-map "\r" nil)

; ; irony mode
; (add-hook 'c++-mode-hook 'irony-mode)
; (add-hook 'c-mode-hook 'irony-mode)
; (add-hook 'objc-mode-hook 'irony-mode)

; ;; replace the `completion-at-point' and `complete-symbol' bindings in
; ;; irony-mode's buffers by irony-mode's function
; (defun my-irony-mode-hook ()
;   (define-key irony-mode-map [remap completion-at-point]
;     'irony-completion-at-point-async)
;   (define-key irony-mode-map [remap complete-symbol]
;     'irony-completion-at-point-async))
; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

; (eval-after-load 'company
;   '(add-to-list 'company-backends 'company-irony))

; Google stuff
; (setq google-paths-use-installed nil)
; (add-to-list 'load-path "~/code/google3/devtools/editors/emacs")
; (require 'google)
; (require 'p4-google)                ;; g4-annotate, improves find-file-at-point
; (require 'compilation-colorization) ;; colorizes output of (i)grep
; (require 'rotate-clients)           ;; google-rotate-client
; (require 'rotate-among-files)       ;; google-rotate-among-files
; (require 'googlemenu)               ;; handy Google menu bar
; (require 'p4-files)                 ;; transparent support for Perforce filesystem
; (require 'google3)                  ;; magically set paths for compiling google3 code
; (require 'google3-build)            ;; support for blaze builds
; (require 'csearch)                  ;; Search the whole Google code base.

