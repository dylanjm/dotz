;;; init.el --- Emacs main configuration file -*-
;;;
;;; Commentary:
;;; Emacs config by dylanjm
;;;
;;; Code:
(defvar my--gc-cons-threshold gc-cons-threshold)
(defvar my--gc-cons-percentage gc-cons-percentage)
(defvar my--file-name-handler-alist file-name-handler-alist)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 1.0
      inhibit-compacting-font-caches t
      message-log-max 16384
      file-name-handler-alist nil)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold my--gc-cons-threshold
                  gc-cons-percentage my--gc-cons-percentage
                  file-name-handler-alist my--file-name-handler-alist)))

(defvar package--init-file-ensured)
(setq package-enable-at-startup nil
      package--init-file-ensured nil)

(setq-default ad-redefinition-action 'accept
              auto-save-file-name-transforms '((".*" "~/.cache/emacs-backups" t))
              auto-window-vscroll nil
              backup-by-copying t
              backup-directory-alist '(("." . "~/.cache/emacs-backups"))
              column-number-mode nil
              create-lockfiles nil
              cursor-in-non-selected-windows nil
              cursor-type 'bar
              display-time-default-load-average nil
              fill-column 80
              frame-title-format '("%b - Emacs")
              help-window-select t
              indent-tabs-mode nil
              inhibit-startup-screen t
              line-number-mode nil
              line-move-visual nil
              load-prefer-newer t
              mode-line-position nil
              mode-line-in-non-selected-windows nil
              redisplay-dont-pause t
              ring-bell-function 'ignore
              scroll-conservatively most-positive-fixnum
              scroll-margin 10
              size-indication-mode nil
              select-enable-clipboard t
              tab-width 4
              vc-follow-symlinks t
              view-read-only t
              uniquify-buffer-name-style 'forward)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(global-hl-line-mode 1)
(global-display-fill-column-indicator-mode 1)
(global-display-line-numbers-mode)

(blink-cursor-mode 0)
(tooltip-mode -1)
(menu-bar-mode -1)
(fringe-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(fset 'menu-bar-open nil)
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list
 'default-frame-alist
 '(font . "-*-Iosevka Nerd Font Mono-light-normal-normal-*-16-*-*-*-m-0-iso10646-1"))

(defvar package-archives)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t
        use-package-verbose t))

(use-package all-the-icons :defer 0.5)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns nil))
  :hook (after-init . exec-path-from-shell-initialize))

(use-package darktooth-theme
  :config (load-theme 'darktooth t))

(use-package doom-themes
  :config
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  (setq doom-themes-enable-italic
        doom-themes-enable-bold))

(use-package doom-modeline
  :config
  (set-face-attribute 'mode-line nil :height 140)
  (set-face-attribute 'doom-modeline-bar nil :background "#1D2021")
  (set-face-attribute 'doom-modeline-project-dir nil :foreground "#528B8B")
  (set-face-attribute 'doom-modeline-project-parent-dir nil :foreground "#613620")
  (set-face-attribute 'doom-modeline-buffer-major-mode nil :weight 'bold :foreground "#613620")
  (setq doom-modeline-percent-position nil
        doom-modeline-buffer-encoding nil
        doom-modeline-height 5
        doom-modeline-bar-width 3
        find-file-visit-truename t)
  (doom-modeline-mode 1))

(use-package solaire-mode
  :config
  (solaire-mode-swap-bg)
  (solaire-global-mode 1))

(use-package magit)

(use-package eyebrowse
  :disabled
  :commands eyebrowse-mode
  :config (eyebrowse-mode t))

(use-package prog-mode
  :ensure nil
  :hook ((prog-mode . show-paren-mode)))

(use-package eldoc :hook (emacs-lisp-mode . eldoc-mode))

(use-package savehist
  :ensure nil
  :custom
  (history-delete-duplicates t)
  (history-length t)
  (savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
  (savehist-file (expand-file-name "~/.cache/emacs-history"))
  (savehist-save-minibuffer-history 1)
  :config (savehist-mode 1))

(use-package whitespace
  :ensure nil
  :hook (((prog-mode text-mode) . whitespace-turn-on)
         (before-save . whitespace-cleanup))
  :custom
  (whitespace-style '(face empty indentation::space tab trailing)))

(use-package minions
  :commands minions-mode
  :config (minions-mode 1))

(use-package aggressive-indent
  :hook (emacs-lisp-mode . aggressive-indent-mode)
  :custom (aggressive-indent-comments-too))

(use-package hungry-delete
  :config (hungry-delete-mode 1))

(use-package company
  :commands global-company-mode
  :bind
  (:map company-active-map
        ("RET" . nil)
        ([return] . nil)
        ("TAB" . company-complete-selection)
        ([tab] . company-complete-selection)
        ("C-f" . company-complete-common)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :hook (after-init . global-company-mode)
  :config (setq company-transformers '(company-sort-by-occurrence))
  :custom
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-tooltip-align-annotations 't)
  (company-show-numbers t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package undo-tree
  :defer 0.5
  :commands global-undo-tree-mode
  :config (global-undo-tree-mode 1))

(use-package gcmh
  :ensure nil
  :commands gcmh-mode
  :config (gcmh-mode 1))

(use-package ivy
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         :map ivy-minibuffer-map
         ("<tab>" . ivy-alt-done)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-switch-buffer-kill))
  :custom
  (ivy-dynamic-exhibit-delay-ms 250)
  (ivy-case-fold-search-default t)
  (ivy-re-builders-alist '((t . ivy--regex-plus)))
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("C-x C-f" . counsel-find-file)
         ("C-x C-d" . counsel-dired-jump)
         ("C-x C-l" . counsel-find-library)
         ("C-x C-r" . counsel-recentf)))

(use-package swiper
  :bind (("C-s" . swiper)
         :map swiper-map
         ("M-%" . swiper-query-replace)))

(use-package all-the-icons-ivy
  :config
  (add-to-list 'all-the-icons-ivy-file-commands
               '(counsel-find-file counsel-dired-jump counsel-recentf counsel-find-library))
  (add-to-list 'all-the-icons-ivy-buffer-commands
               '(ivy-switch-buffer-other-window))
  (all-the-icons-ivy-setup))

(use-package dired
  :ensure nil
  :delight "Dired "
  :custom
  (dired-auto-revert-buffer t)
  (dired-dwim-target t)
  (dired-hide-details-hide-symlink-targets nil)
  (dired-listing-switches "-alh")
  (dired-ls-F-marks-symlinks nil)
  (dired-recursive-copies 'always))

(use-package dired-narrow
  :bind (("C-c C-n" . dired-narrow)
         ("C-c C-f" . dired-narrow-fuzzy)
         ("C-c C-r" . dired-narrow-regexp)))

(use-package dired-subtree
  :bind (:map dired-mode-map
              ("<backtab>" . dired-subtree-cycle)
              ("<tab>" . dired-subtree-toggle)))

(use-package treemacs)

;; (use-package tex
;;   :ensure auctex
;;   :bind (:map TeX-mode-map
;;               ("C-c C-o" . TeX-recenter-output-buffer)
;;               ("C-c C-l" . TeX-next-error)
;;               ("M-[" . outline-previous-heading)
;;               ("M-]" . outline-next-heading))
;;   :hook (LaTeX-mode . reftex-mode)
;;   :custom
;;   (TeX-auto-save t)
;;   (TeX-byte-compile t)
;;   (TeX-clean-confirm nil)
;;   (TeX-master 'dwim)
;;   (TeX-parse-self t)
;;   (TeX-PDF-mode t)
;;   (TeX-source-correlate-mode t)
;;   (TeX-view-program-selection '((output-pdf "PDF Tools")))
;;   (Tex-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
;;   (TeX-source-correlate-start-server t))

;; (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

;; (use-package company-auctex
;;   :after (auctex company)
;;   :config (company-auctex-init))

;; (setq-default TeX-engine 'xetex)

;; (use-package reftex
;;   :after auctex
;;   :custom
;;   (reftex-plug-into-AUCTeX t)
;;   (reftex-save-parse-info t)
;;   (reftex-use-multiple-selection-buffers t))

;; (use-package pdf-tools
;;   :defer 1
;;   :magic ("%PDF" . pdf-view-mode)
;;   :init (pdf-tools-install :no-query))

;; (use-package server
;;   :ensure nil
;;   :config
;;   (unless (server-running-p)
;;     (server-start)))

;; (use-package pdf-view
;;   :ensure nil
;;   :after pdf-tools
;;   :bind (:map pdf-view-mode-map
;;               ("C-s" . isearch-forward)
;;               ("d" . pdf-annot-delete)
;;               ("h" . pdf-annot-add-highlight-markup-annotation)
;;               ("t" . pdf-annot-add-text-annotation))
;;   :custom
;;   (pdf-view-display-size 'fit-page)
;;   (pdf-view-resize-factor 1.1)
;;   (pdf-view-use-unicode-lighter nil))

(provide 'init)
;;; init.el ends here
