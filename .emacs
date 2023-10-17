(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(back-button dimmer doom-modeline exec-path-from-shell lsp-ui magit
                 marginalia minions nerd-icons-corfu orderless
                 timu-rouge-theme vertico zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;;; appearance

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(use-package timu-rouge-theme
  :config (load-theme 'timu-rouge t)
  :custom (timu-rouge-mode-line-border t))

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)

;; macos specific settings
(when (equal system-type 'darwin)
  ;; titlebar settings
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (set-frame-parameter nil 'ns-appearance 'dark) ; dark themes only

  ;; fullscreen with Cmd-ctrl-f
  (bind-key "C-s-f" 'toggle-frame-fullscreen))

;;; other tweaks

;; always follow symlinks, do not ask
(setq vc-follow-symlinks t)

;; always show column number
(setq column-number-mode t)

;; do not generate xxx~ files
(setq make-backup-files nil)

;; do not use tab
(setq-default indent-tabs-mode nil)

;; disable eshell wrapper for `make`
(fmakunbound 'eshell/make)

;; fix PATH and exec-path, necessary on mac
(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

;;; packages

;; fuzzy search commands
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
;; vertical completion buffer
(use-package vertico
  :init (vertico-mode))
;; show command descriptions
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

;; jump backward / forward
(use-package back-button
  :custom (back-button-no-wrap t)
  :init
  (back-button-mode 1)
  (global-set-key [f6] 'back-button-global-backward)
  (global-set-key [f7] 'back-button-global-forward))

;; magit
(use-package magit)

;; highlight changed lines
;; (use-package diff-hl
;;   :init (global-diff-hl-mode))

;; better modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  
  (setq display-time-default-load-average nil) ; hide CPU usage
  (display-time-mode 1)
  (display-battery-mode 1))
(use-package nerd-icons)
;; hide list of minor modes
;; (use-package minions
;;   :init (minions-mode))

;; highlight selected buffer
(use-package dimmer
  :custom (dimmer-fraction 0.3)
  :init (dimmer-mode t))

;; LSP
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
	lsp-headerline-breadcrumb-enable nil)
  :hook ((c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)
	 (zig-mode . lsp-deferred))
  :commands (lsp lsp-deferred))
;; lsp-ui
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

;; zig
(use-package zig-mode)
