
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; (add-to-list 'default-frame-alist '(font . "Inconsolata-g-13" ))
;; (set-face-attribute 'default t :font "Inconsolata-g-13")
(set-frame-font "Inconsolata-15" nil)


(load-theme 'base16-ocean t)

(set-face-background 'mode-line "#b48ead")
(set-face-background 'mode-line-inactive "#a7adba")
(set-face-foreground 'mode-line "#2b303b")
(set-face-foreground 'mode-line-inactive "#2b303b")

(setq-default indent-tabs-mode nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)

(setq frame-title-format "%b")

(setq visible-bell t)

(desktop-save-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Keybonds

(setq mac-command-modifier 'meta)
(global-set-key (kbd "M-`") 'other-frame)

;; (global-set-key [(meta a)] 'mark-whole-buffer)
;; (global-set-key [(meta v)] 'yank)
;; (global-set-key [(meta c)] 'kill-ring-save)
;; (global-set-key [(meta s)] 'save-buffer)
;; (global-set-key [(meta l)] 'goto-line)
;; (global-set-key [(meta w)] 'delete-window)
;; (global-set-key [(meta z)] 'undo)
;; (global-set-key [(meta q)] 'save-buffers-kill-terminal)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(show-paren-mode 1)
(column-number-mode 1)
(line-number-mode 1)
(size-indication-mode 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
(setq tab-width 2)
(setq scroll-step 1)
(setq-default cursor-type 'bar) 

(fset 'yes-or-no-p 'y-or-n-p)

(setq require-final-new)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; evil

;; (require 'evil)
;; (evil-mode 1)

;; (blink-cursor-mode 0)

;; (setq evil-emacs-state-cursor '("red" box))
;; (setq evil-normal-state-cursor '("red" box))
;; (setq evil-visual-state-cursor '("orange" box))
;; (setq evil-insert-state-cursor '("green" bar))
;; (setq evil-replace-state-cursor '("green" bar))
;; (setq evil-operator-state-cursor '("green" hollow))

;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; (define-key evil-motion-state-map ";" 'evil-ex)
;; (setq evil-move-cursor-back nil)

;; (evil-define-key 'insert haskell-interactive-mode-map (kbd "RET") 'haskell-interactive-mode-return)
;; (evil-define-key 'normal haskell-interactive-mode-map (kbd "RET") 'haskell-interactive-mode-return)


;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;; (require 'powerline)

;; (custom-set-faces
;;  '(mode-line ((t (:foreground "#2B303B" :background "#8FA1B3" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#2B303B" :background "#343D46" :box nil)))))

;; (setq powerline-color1 "#343D46")
;; (setq powerline-color "#8FA1B3")

;; evil nerd commenter
;; (evilnc-default-hotkeys)

;; (setq-default cursor-type 'bar) 

;; (require 'evil-surround)
;; (global-evil-surround-mode 1)

(setq backup-directory-alist `(("." . "~/.Trash")))

(require 'popwin)
(popwin-mode 1)

(require 'auto-complete-config)
(ac-config-default)

;; spelling
;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; (defun turn-spell-checking-on ()
;;   "Turn speck-mode or flyspell-mode on."
;;   (flyspell-mode 1)
;;   )

(add-hook 'text-mode-hook 'turn-spell-checking-on)

(require 'langtool)
(setq langtool-language-tool-jar "~/bin/LanguageTool-2.7/languagetool-commandline.jarq"
      langtool-mother-tongue "en-US"
      langtool-disabled-rules '("WHITESPACE_RULE"
                                "EN_UNPAIRED_BRACKETS"
                                "COMMA_PARENTHESIS_WHITESPACE"
                                "EN_QUOTES"))

;; Global keybindings

;; (global-set-key (kbd "A-<right>") 'forward-word)
;; (global-set-key (kbd "A-<left>") 'backward-word)
;; (global-set-key (kbd "M-<right>") 'end-of-
;; (global-set-key (kbd "M-<left>") 'beginning-of-line)
;; (global-set-key (kbd "M-<up>") 'beginning-of-buffer)
;; (global-set-key (kbd "M-<down>") 'end-of-buffer)

(global-set-key (kbd "M-;") 'comment-dwim-line)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-o") 'ido-switch-buffer)

(global-set-key (kbd "A-M-<left>") 'windmove-left)
(global-set-key (kbd "A-M-<right>") 'windmove-right)
(global-set-key (kbd "A-M-<up>") 'windmove-up)
(global-set-key (kbd "A-M-<down>") 'windmove-down)
;; (global-set-key (kbd "C-w") 'clipboard-kill-region)
;; (global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
;; (global-set-key (kbd "C-y") 'clipboard-yank)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'execute-extended-command)


(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;; --- Obj-C switch between header and source ---

(setq cc-other-file-alist

      `(("\\.cpp$" (".hpp" ".h"))
        ("\\.h$" (".c" ".cpp" ".m" ".mm"))
        ("\\.hpp$" (".cpp" ".c"))
        ("\\.m$" (".h"))
        ("\\.mm$" (".h"))
        ))
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))


;; yasnippet for objective-c

(require 'yasnippet)

;; yasnippet
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)

;; This is where your snippets will lie.
(setq yas/root-directory '("~/.emacs.d/snippets"))
(mapc 'yas/load-directory yas/root-directory)


;; auto-complete
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20141208.809")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20141208.809/dict")

(setq-default ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'objc-mode)