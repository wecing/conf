(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-ui marginalia minions orderless timu-rouge-theme vertico
	    zig-mode)))
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

;; macos titlebar settings
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(set-frame-parameter nil 'ns-appearance 'dark) ; dark themes only

(use-package timu-rouge-theme
  :config (load-theme 'timu-rouge t)
  :custom (timu-rouge-mode-line-border t))

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)

;; simplify mode line
(setq-default mode-line-format
  '("%e" mode-line-front-space
    (:propertize
     ("" mode-line-mule-info mode-line-client mode-line-modified
      mode-line-remote)
     display (min-width (5.0)))
    mode-line-frame-identification mode-line-buffer-identification
    "   " mode-line-position mode-line-modes mode-line-end-spaces))

;;; other tweaks

;; always follow symlinks, do not ask
(setq vc-follow-symlinks t)

;; must put these packages in `~/.local/bin`:
;;   zig, zls
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "HOME") "/.local/bin"))
(setq exec-path (append exec-path (list (concat (getenv "HOME") "/.local/bin"))))

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

;; hide list of minor modes
(use-package minions
  :init (minions-mode))

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
