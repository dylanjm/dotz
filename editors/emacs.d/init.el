;;; init.el --- Emacs main configuration file -*- lexical-binding: t; buffer-read-only: t; coding: utf-8-*-
;;;
;;; Commentary:
;;; Emacs `init.el' config by dylanjm.
;;; This file was automatically generated by `org-babel-tangle'.
;;; Do not change this file.  Main config is located in emacs.d/dotemacs.org
;;;
;;; Code:





(add-hook 'write-file-hooks 'time-stamp)



(use-package cus-start
  :straight nil
  :custom
  (ad-redefinition-action 'accept)
  (cursor-in-non-selected-windows nil)
  (cursor-type 'bar)
  (disabled-command-function nil)
  (display-time-default-load-average nil)
  (echo-keystrokes 0.02)
  (fill-column 80)
  (frame-title-format '("%b - Emacs"))
  (icon-title-format frame-title-format)
  (indent-tabs-mode nil)
  (mode-line-in-non-selected-windows nil)
  (mouse-wheel-progressive-speed nil)
  (mouse-wheel-scroll-amount '(1))
  (ring-bell-function #'ignore)
  (scroll-conservatively most-positive-fixnum)
  (scroll-margin 5)
  (scroll-preserve-screen-position t)
  (scroll-step 1)
  (select-enable-clipboard t)
  (sentence-end-double-space nil)
  (tab-always-indent 'complete)
  (tab-width 4)
  (uniquify-buffer-name-style 'post-forward)
  (use-dialog-box nil)
  (use-file-dialog nil)
  (vc-follow-symlinks t)
  (window-combination-resize t))

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-g") 'minibuffer-keyboard-quit)
(global-unset-key (kbd "C-z"))

(when (file-exists-p custom-file)
  (load custom-file :noerror))

(when (file-exists-p djm--secret-file)
  (load djm--secret-file :noerror))

(use-package pixel-scroll
  :straight nil
  :init (pixel-scroll-mode 1))

(use-package ns-win
  :straight nil
  :init
  (setq mac-command-modifier 'meta
        mac-option-modifier 'meta
        mac-right-command-modifier 'super
        mac-right-option-modifier 'none
        mac-function-modifier 'hyper))

(use-package saveplace
  :straight nil
  :config (save-place-mode +1))

(use-package savehist
  :straight nil
  :init
  (setq history-delete-duplicates t
        savehist-additional-variables '(kill-ring regexp-search-ring))
  :config
  (savehist-mode +1))

(use-package files
  :straight nil
  :config
  (setq backup-by-copying t
        confirm-kill-processes nil
        create-lockfiles nil
        delete-old-versions t
        require-final-newline t
        view-read-only t))

(use-package autorevert
  :straight nil
  :init
  (setq auto-revert-verbose nil
        global-auto-revert-non-file-buffers t
        auto-revert-use-notify nil)
  :config
  (global-auto-revert-mode 1))

(use-package recentf
  :straight nil
  :init
  (setq recentf-max-saved-items 1000
        recentf-auto-cleanup 'never)
  :config
  (recentf-mode 1))

(use-package auth-source
  :config
  (setq auth-sources '(no-littering-expand-etc-file-name "authinfo.gpg")))

(use-package osx-trash
  :init
  (setq delete-by-moving-to-trash t)
  :config (osx-trash-setup))

(use-package async
  :hook ((dired-mode . dired-async-mode))
  :preface
  (autoload 'aysnc-bytecomp-package-mode "async-bytecomp")
  (autoload 'dired-async-mode "dired-async.el" nil t)
  :config
  (setq async-bytecomp-allowed-packages '(all))
  (async-bytecomp-package-mode 1))

(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-items '((recents . 5)
                     (projects . 5)
                     (bookmarks . 5)
                     (agenda . 5)))
  :config
  (set-face-bold 'dashboard-heading-face t))

(use-package doom-themes
  :disabled t
  :demand t
  :config
  (load-theme 'doom-gruvbox t))

(use-package gruvbox-theme
  :demand t
  :config
  (load-theme 'gruvbox-dark-hard t))

(blink-cursor-mode 0)

;; emacs 27 added new `:extend' keyword which breaks most themes
(if (boundp 'hl-line)
    (set-face-attribute hl-line nil :extend t))

(dolist (face '(region secondary-selection))
  (set-face-attribute face nil :extend t))

(with-eval-after-load 'org
  (dolist (face '(org-block
                  org-block-begin-line
                  org-block-end-line
                  org-level-1
                  org-quote))
    (set-face-attribute face nil :extend t)))

(with-eval-after-load 'magit
  (dolist (face '(magit-diff-hunk-heading
                  magit-diff-hunk-heading-highlight
                  magit-diff-hunk-heading-selection
                  magit-diff-hunk-region
                  magit-diff-lines-heading
                  magit-diff-lines-boundary
                  magit-diff-conflict-heading
                  magit-diff-added
                  magit-diff-removed
                  magit-diff-our
                  magit-diff-base
                  magit-diff-their
                  magit-diff-context
                  magit-diff-added-highlight
                  magit-diff-removed-highlight
                  magit-diff-our-highlight
                  magit-diff-base-highlight
                  magit-diff-their-highlight
                  magit-diff-context-highlight
                  magit-diff-whitespace-warning
                  magit-diffstat-added
                  magit-diffstat-removed
                  magit-section-heading
                  magit-section-heading-selection
                  magit-section-highlight
                  magit-section-secondary-heading
                  magit-diff-file-heading
                  magit-diff-file-heading-highlight
                  magit-diff-file-heading-selection))
    (set-face-attribute face nil :extend t)))

  (use-package hl-line
    :straight nil
    :commands (hl-line-mode global-hl-line-mode))

  (use-package simple
    :straight nil
    :config
    (setq column-number-mode nil
          eval-expression-print-length nil
          eval-expression-print-level nil
          line-number-mode t
          line-move-visual nil
          set-mark-command-repeat-pop t
          track-eol t))

(use-package minions
  :defer 0.5
  :custom
  (minions-mode-line-lighter "...")
  (minions-mode-line-delimiters '("" . ""))
  :config (minions-mode 1))



(use-package tab-line
  :disabled t
  :straight nil
  :custom
  (tab-line-new-tab-choice nil)
  (tab-line-separator nil)
  (tab-line-close-button-show nil)
  :init (global-tab-line-mode))

(use-package page-break-lines
  :defer 3.0
  :config
  (setq page-break-lines-modes '(prog-mode
                                 ibuffer-mode
                                 text-mode
                                 compilation-mode
                                 help-mode
                                 org-agenda-mode))
    (global-page-break-lines-mode))

(use-package dimmer
  :disabled t
  :custom
  (dimmer-fraction 0.33)
  (dimmer-exclusion-regexp-list '(".*minibuf.*"
                                  ".*which-key.*"
                                  ".*messages.*"
                                  ".*async.*"
                                  ".*warnings.*"
                                  ".*lv.*"
                                  ".*ilist.*"
                                  ".*posframe.*"
                                  ".*transient.*"))
  :config (dimmer-mode))

(use-package key-chord
  :custom (key-chord-two-keys-delay 0.05)
  :config (key-chord-mode 1))

(use-package prescient
  :config (prescient-persist-mode +1))

(use-package posframe
  :defer 2.0
  :custom
  (posframe-arghandler #'hemacs-posframe-arghandler)
  :config
  (defun hemacs-posframe-arghandler (posframe-buffer arg-name value)
    (let ((info '(:internal-border-width 10 :min-width 90)))
      (or (plist-get info arg-name) value))))

(use-package eterm-256color
  :hook (vterm-mode . eterm-256color-mode))

(use-package vterm
  :defer 10
  :config (setq vterm-term-environment-variable "eterm-color"))

(use-package vterm-toggle
  :straight (:host github :repo "jixiuf/vterm-toggle")
  :bind (("C-c C-t" . vterm-toggle)
         ("C-c C-y" . term-toggle-cd)))

(use-package projectile
  :defer 5
  :custom
  (projectile-completion-system 'ivy)
  (projectile-enable-caching t)
  :config
  (projectile-mode 1))

(use-package abbrev
  :straight nil)

(use-package hippie-exp
   :bind (([remap dabbrev-expand] . hippie-expand))
   :config
   (setq hippie-expand-try-functions-list
         '(try-expand-dabbrev
           try-expand-dabbrev-all-buffers
           try-expand-dabbrev-from-kill
           try-complete-file-name-partially
           try-complete-file-name
           try-expand-all-abbrevs
           try-expand-list
           try-complete-lisp-symbol-partially
           try-complete-lisp-symbol)))

(use-package company
  :defer 0.5
  :bind (:map company-active-map
              ("RET" . nil)
              ([return] . nil)
              ("TAB" . company-complete-selection)
              ([tab] . company-complete-selection)
              ("C-f" . company-complete-common)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  :config
  (setq company-frontends '(company-pseudo-tooltip-frontend))
  (setq company-auto-complete-chars nil
        company-async-timeout 10
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-other-buffers nil
        company-idle-delay 0.15
        company-minimum-prefix-length 2
        company-require-match 'never
        company-show-numbers t
        company-tooltip-align-annotations t)
  (global-company-mode +1))

(use-package company-prescient
  :demand t
  :after (company)
  :config (company-prescient-mode +1))

(use-package company-math
  :after (company)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-math-symbols-latex))

(use-package company-lsp
  :after (lsp-mode)
  :config (setq company-lsp-cache-canidates 'auto))

(use-package company-anaconda
  :after (anaconda-mode)
  :config (add-to-list 'company-backends 'company-anaconda))

(use-package company-box
  :disabled t
  :after (company)
  :config (company-box-mode 1))

(use-package yasnippet
  :hook ((prog-mode org-mode text-mode) . (lambda () (require 'yasnippet)))
  :commands
  (yas-global-mode
   yas-new-snippet
   yas-insert-snippet
   yas-next-field
   yas-prev-field
   yas-visit-snippet-file)
  :custom
  (yas-verbosity 1)
  (yas-wrap-around-region t)
  (yas-prompt-functions '(yas-completing-prompt))
  (yas-snippet-dirs '(djm--yasnippet-dir))
  :config
  (yas-global-mode +1))

(use-package yas-funcs
  :straight nil
  :after yasnippet)

(use-package yasnippet-snippets
  :after (yasnippet)
  :config
  (yas-reload-all))

(use-package ivy-yasnippet
  :after (yasnippet))

(use-package auto-insert
  :straight nil
  :bind (("C-c ci a" . auto-insert)))

(use-package counsel
  :hook ((after-init . ivy-mode)
         (ivy-mode . counsel-mode))
  :bind (([remap ido-switch-buffer] . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("C-c C-r" . ivy-resume)
         ("C-c v p" . ivy-push-view)
         ("C-c v o" . ivy-pop-view)
         ("C-c v ." . ivy-switch-view)
         ([remap kill-ring-save] . ivy-kill-ring-save)
         :map ivy-minibuffer-map
         ("<tab>" . ivy-alt-done)
         ("C-w" . ivy-yank-word)
         (:map ivy-switch-buffer-map
               ([remap kill-buffer] . ivy-switch-buffer-kill))

         (:map counsel-mode-map
               ([remap dired] . counsel-dired)
               ("M-x" . counsel-M-x)
               ([remap find-file] . counsel-find-file)
               ([remap dired-jump] . counsel-dired-jump)
               ("C-x C-l" . counsel-find-library)
               ("C-x C-r" . counsel-recentf)
               ("C-x C-v" . counsel-set-variable)
               ("C-x C-u" . counsel-unicode-char)
               ("C-x j" . counsel-mark-ring)
               ("C-c g" . counsel-grep)
               ("C-c h" . counsel-command-history)
               ("C-c j" . counsel-git)
               ("C-c j" . counsel-git-grep)
               ("C-c r" . counsel-rg)
               ("C-c z" . counsel-fzf)
               ("C-c c w" . counsel-colors-web)
               ("C-h F" . counsel-describe-face)
               ("C-h f" . counsel-describe-function)
               ("C-h v" . counsel-describe-variable))

         ("C-s" . swiper)
         ("C-c c s" . swiper-isearch)
         ("C-c c r" . swiper-isearch-backward)
         ("C-S-s" . swiper-all)
         :map swiper-map
         ("M-%" . swiper-query-replace)
         ("M-s" . swiper-isearch-toggle)
         :map isearch-mode-map
         ("M-s" . swiper-isearch-toggle))

  :custom
  (enable-recursive-minibuffers t)
  (ivy-dynamic-exhibit-delay-ms 250)
  (ivy-use-selectable-prompt t)
  (ivy-initial-inputs-alist nil)
  (ivy-case-fold-search-default t)
  (ivy-use-virtual-buffers t)
  (ivy-virtual-abbreviate 'name)
  (ivy-count-format "")
  (ivy-flx-limit 2000)

  :config
  (use-package ivy-hydra)
  (use-package ivy-prescient
    :demand t
    :after (counsel)
    :config (ivy-prescient-mode +1))

  (setq counsel-grep-base-command
        "rg -S --no-heading --line-number --color never '%s' %s")

  (setq ivy-re-builders-alist '((t . ivy-prescient-re-builder)
                                (t . ivy--regex-fuzzy)
                                (swiper . ivy--regex-plus)
                                (swiper-isearch . ivy--regex-plus))))

(use-package amx
  :hook (ivy-mode . amx-mode))


(use-package ivy-posframe
  :hook (ivy-mode . ivy-posframe-mode)
  :config
  (setq ivy-posframe-hide-minibuffer t)
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)
                                               (swiper . nil))))

(use-package man :defer 2.0)

(use-package help
  :defer 2.0
  :straight nil
  :config
  (setq help-window-select t)
  (advice-add 'help-window-display-message :override #'ignore))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(use-package eldoc
  :defer 2.0
  :custom (eldoc-idle-delay 2))

(use-package which-key
  :defer 2.0
  :custom (which-key-idle-delay 0.5)
  :config (which-key-mode))

(use-package ispell
  :straight nil
  :custom
  (ispell-dictionary "en_US")
  (ispell-program-name (executable-find "hunspell"))
  (ispell-really-hunspell t)
  (ispell-silently-savep t))

(use-package ws-butler
  :defer 2.0
  :commands (ws-butler-global-mode)
  :config (ws-butler-global-mode 1))

(use-package multiple-cursors
  :disabled t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

(use-package editorconfig
  :straight t
  :config
  (editorconfig-mode 1))

  (use-package default-text-scale
    :defer 10
    :commands (default-text-scale-increase
               default-text-scale-decrease
               default-text-scale-reset)
    :bind (("C-c <up>" . default-text-scale-increase)
           ("C-c <down>" . default-text-scale-decrease)
           ("C-M-]". default-text-scale-reset))
    :custom (default-text-scale-amount 30))

  (use-package delsel
    :straight nil
    :config (delete-selection-mode 1))

  (use-package align
    :disabled t
    :straight nil
    :general ("C-x a a" #'align-regexp))

  (use-package zop-to-char
    :bind (("M-z" . zop-to-char)
           ("M-z" . zop-up-to-char)))

  (use-package undo-tree
    :defer 10.0
    :config (global-undo-tree-mode 1))

  (use-package aggressive-indent
    :defer 10.0
    :commands (aggressive-indent-mode))

  (use-package hungry-delete
    :defer 10.0
    :commands (hungry-delete-mode))

  (use-package prog-mode
    :straight nil
    :hook ((prog-mode . prettify-symbols-mode)
           (prog-mode . show-paren-mode)
           (prog-mode . display-line-numbers-mode)
           (prog-mode . display-fill-column-indicator-mode)))

  (use-package rainbow-delimiters
    :hook (prog-mode . rainbow-delimiters-mode))

  (use-package term
    :straight nil
    :hook (term-mode . (lambda () (hl-line-mode -1))))

(use-package avy
  :chords
  ("jk" . avy-pop-mark)
  ("jl" . avy-goto-line)
  :config (avy-setup-default))

(use-package ace-window
  :bind (("C-x o" . ace-window)))

(use-package windower
  :straight (:repo "https://gitlab.com/ambrevar/emacs-windower")
  :bind (("C-c w o" . windower-switch-to-last-buffer)
         ("C-c w t" . windower-toggle-split)))

(use-package windmove
  :bind (("C-c w j" . windmove-left)
         ("C-c w k" . windmove-right)
         ("C-c w n" . windmove-down)
         ("C-c w u" . windmove-up)))

(use-package dired
:defer 3
:straight nil
:functions (dired wdired-change-to-wdired-mode)
:bind (:map dired-mode-map
              ("C-c C-e" . wdired-change-to-wdired-mode))
              :custom
              (dired-auto-revert-buffer t)
              (dired-dwim-target t)
              (dired-guess-shell-gnutar "gtar")
              (dired-use-ls-dired nil)
              (dired-listing-switches "-alhF")
              (dired-ls-f-marks-symlinks t)
              (dired-recursive-deletes 'always)
              (dired-recursive-copies 'always))

(use-package dired-aux
  :straight nil
  :after (dired))

(use-package dired-x
  :straight nil
  :after (dired))

(use-package diredfl
  :after (dired)
  :hook (dired-mode . diredfl-global-mode))

(use-package dired-ranger
  :bind (:map dired-mode-map
              ("C-c C-c" . dired-ranger-copy)
              ("C-c C-m" . dired-ranger-move)
              ("C-c C-p" . dired-ranger-move)
              ("C-c C-b" . dired-ranger-bookmark)
              ("C-c b v" . dired-ranger-bookmark-visit)))

(use-package dired-git-info
  :bind (:map dired-mode-map
              (":" . dired-git-info-mode)))

(use-package dired-rsync
  :bind (:map dired-mode-map
              ("C-c C-r" . dired-rsync)))

(use-package dired-subtree
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-insert)
              (";" . dired-subtree-remove)))

(use-package fd-dired
  :after (dired))

(use-package dired-sidebar
  :bind ("M-\\" . dired-sidebar-toggle-sidebar)
  :custom (dired-sidebar-theme 'vscode)
  :config (use-package vscode-icon))

(use-package ibuffer
  :bind (([remap list-buffers] . ibuffer))
  :custom
  (ibuffer-expert t)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-formats '((mark modified " " (mode 1 1) " " (name 25 25 :left :elide) " " filename-and-process)))
  (ibuffer-never-show-predicates (list (rx (or "*magit-"
                                               "*git-auto-push*"
                                               "*backtrace*"
                                               "*new*"
                                               "*org*"
                                               "*flycheck error messages*"
                                               "*help*")))))

(use-package ibuf-ext
  :straight nil
  :hook (ibuffer-mode . ibuffer-auto-mode)
  :custom (ibuffer-show-empty-filter-groups nil))

(use-package ibuffer-projectile
  :defer 5.0
  :commands (ibuffer-projectile-set-filter-groups)
  :functions (ibuffer-do-sort-by-alphabetic)
  :preface
  (defun config-ibuffer--setup-buffer ()
    (ibuffer-projectile-set-filter-groups)
    (add-to-list 'ibuffer-filter-groups '("dired" (mode . dired-mode)))
    (add-to-list 'ibuffer-filter-groups '("system" (predicate . (-contains? '("*messages*" "*scratch*") (buffer-name)))))
    (add-to-list 'ibuffer-filter-groups '("shells" (mode . eshell-mode)))
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic))
    (when (bound-and-true-p page-break-lines-mode)
      (page-break-lines--update-display-tables)))
  :init
  (add-hook 'ibuffer-hook #'config-ibuffer--setup-buffer)
  :custom
  (ibuffer-projectile-prefix ""))

(use-package org-hydras
  :straight nil
  :commands (org-babel/body))

(use-package org
  :straight nil
  :general
  ("C-c a" #'org-agenda
   "C-c s" #'org-search-view
   "C-c t" #'org-todo-list
   "C-c /" #'org-tags-view)

  :hook (org-mode . visual-line-mode)
  :hook (after-save . djm/tangle-init-org-file-on-save)
  :preface
  (defun djm/tangle-init-org-file-on-save ()
    (when (string= buffer-file-name
                   (file-truename "~/.emacs.d/dotemacs.org"))
      (org-babel-tangle)))

  :custom
  (org-hide-emphasis-markers t)
  (org-insert-heading-respect-content t)
  (org-startup-folded 'content)
  (org-enforce-todo-dependencies t)
  (org-special-ctrl-a/e t)
  (org-highlight-sparse-tree-matches nil)
  (org-special-ctrl-k t))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package org-agenda
  :straight nil)

(use-package org-indent
  :straight nil
  :hook (org-mode . org-indent-mode))

(use-package org-babel
  :straight nil
  :bind ("C-c v g" . org-babel-goto-named-src-block))

(use-package org-src
  :straight nil
  :preface
  (defun config-org--supress-final-newline ()
    (setq-local require-final-newline nil))

  (defun config-org--org-src-delete-trailing-space (&rest _)
    (delete-trailing-whitespace))
  :config
  (setq org-src-window-setup 'split-window-below)
  (add-hook 'org-src-mode-hook #'config-org--supress-final-newline)
  (advice-add 'org-edit-src-exit :before #'config-org--org-src-delete-trailing-space))

(use-package toc-org
  :hook ((org-mode . toc-org-mode)
         (markdown-mode . toc-org-mode)))

(use-package htmlize)

(use-package eww
  :defer t
  :straight nil)

(use-package browse-url
  :defer t
  :straight nil
  :custom (browse-urls-browser-function "firefox"))

(use-package vc-hooks
  :straight nil
  :config
  (setq vc-handled-backends nil))

(use-package smerge-mode)
(use-package transient
  :config
  (transient-bind-q-to-quit))

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-popup)))

(use-package git-commit
  :after (magit)
  :custom (git-commit-summary-max-length 50))

(use-package git-gutter
  :commands (global-git-gutter-mode)
  :config (global-git-gutter-mode 1))

(use-package lsp-mode
  :hook ((python-mode cc-mode) . lsp-deferred)
  :custom
  (lsp-eldoc-enable-hover nil)
  (lsp-edoc-render-all nil)
  (lsp-prefer-fly-make nil)
  (lsp-restart nil)
  (lsp-enable-on-type-formatting nil)
  :config
  (use-package lsp-clients
    :straight nil))

(use-package lsp-ui
  :after (lsp-mode)
  :bind (("C-c f" . lsp-ui-sideline-apply-code-actions))
  :config
  (setq lsp-ui-sideline-show-hover nil))

(use-package lsp-ui-doc
  :after (lsp-ui lsp-mode)
  :straight nil)

(use-package flycheck
  :defer 4
  :init
  (defun flycheck-disable-checkers (&rest checkers)
    (unless (bounp 'flycheck-disabled-checkers)
      (setq flycheck-disabled-checkers nil))
    (dolist (checker checkers)
      (cl-pushnew checker flycheck-disabled-checkers)))
  :commands (flycheck-list-errors
             flycheck-error-list-next-error
             flycheck-error-list-previous-error
             flycheck-error-list-goto-error)
  :custom
  (flycheck-emacs-lisp-load-path 'inherit)
  (flycheck-indication-mode 'right-fringe)
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
      [16 48 112 240 112 48 16] nil nil 'center))
  :config
  (global-flycheck-mode 1))

(use-package flycheck-posframe
  :after (flycheck)
  :hook (flycheck-mode . flycheck-posframe-mode)
  :config (add-to-list 'flycheck-posframe-inhibit-functions
                       #'(lambda () (bound-and-true-p company-backend))))

(use-package flycheck-pos-tip
  :after (flycheck)
  :defines flycheck-pos-tip-timeout
  :hook (global-flycheck-mode . flycheck-pos-tip-mode)
  :config (setq flycheck-pos-tip-timeout 30))

(use-package flycheck-popup-tip
  :after (flycheck)
  :hook (flycheck-mode . flycheck-popup-tip-mode))

(use-package ess
  :hook (julia-mode . ess-mode)
  :config
  (add-to-list 'safe-local-variable-values '(outline-minor-mode))
  (add-to-list 'safe-local-variable-values '(whitespace-style
                                             face tabs spaces
                                             trailing lines space-before-tab::space
                                             newline indentation::space empty
                                             space-after-tab::space space-mark
                                             tab-mark newline-mark)))

(use-package python
  :hook (python-mode . config-python--init-python-mode)
  :preface
  (progn
    (autoload 'python-indent-dedent-line "python")
    (autoload 'python-shell-get-process "python")

    (defun config-python--init-python-mode ()
      (setq-local comment-inline-offset 2)
      (setq-local tab-width 4)
      (prettify-symbols-mode -1)
      (when (executable-find "ipython")
        (setq-local python-shell-interpreter "ipython")
        (setq-local python-shell-interpreter-args "--simple-promt -i")))

    (defun config-python-backspace ()
      (interactive)
      (if (equal (char-before) ?\s)
          (unless (python-indent-dedent-line)
            (backward-delete-char-untabify 1))
        (sp-backward-delete-char)))

    (defvar config-python-prev-source-buffer)

    (defun config-python-repl-switch-to-source ()
      (interactive)
      (-when-let (buf config-python-prev-source-buffer)
        (when (buffer-live-p buf)
          (pop-to-buffer buf))))

    (defun config-python-repl ()
      (interactive)
      (when (derived-mode-p 'python-mode)
        (setq config-python-prev-source-buffer (current-buffer)))
      (let ((shell-process
             (or (python-shell-get-process)
                 (with-demoted-errors "Error: %S"
                   (call-interactively #'run-python)
                   (python-shell-get-process)))))
        (unless shell-process
          (error "Failed to start python shell properly"))
        (pop-to-buffer (process-buffer shell-process))))
    :config
    (progn
      (setq python-indent-guess-indent-offset nil)
      (setq python-indent-offset 4)
      (setq python-fill-docstring-style 'django))))

(use-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(use-package py-yapf
  :hook (python-mode . python-auto-format-mode)
  :preface
  (progn
    (defvar python-auto-format-buffer t)

    (defun python-auto-format-maybe ()
      (when python-auto-format-buffer
        (py-yapf-buffer)))

    (define-minor-mode python-auto-format-mode
      nil nil nil nil
      (if python-auto-format-mode
          (add-hook 'before-save-hook 'python-auto-format-maybe nil t)
        (remove-hook 'before-save-hook 'python-auto-format-maybe t)))))

;; (defconst moose-c-style
;;   '((c-tab-always-indent . t)
;;     (c-basic-offset . 2)
;;     (c-hanging-braces-alist . ((substatement-open before after)))
;;     (c-offsets-alist . ((innamespace .0)
;;                         (member-init-intro . 4)
;;                         (statement-block-into . +)
;;                         (substatement-open . 0)
;;                         (substatement-label .0)
;;                         (label .0)
;;                         (statement-cont . +)
;;                         (case-label . +))))
;;   "Moose C++ Programming Style.")

;; (c-add-style "MOOSE" moose-c-style)

;; (setq auto-mode-alist
;;       (append '(("\\.h$" . c++-mode)
;;                 ("\\.i$" . conf-mode)
;;                 ("tests" . conf-mode)
;;                 ("\\.cu". c++-mode))
;;               auto-mode-alist))

;; (defun djm--moose-hook ()
;;   (c-set-style "MOOSE")
;;   (setq-local indent-tabs-mode nil)
;;   (c-toggle-auto-hungry-state)
;;   (c-toggle-auto-newline)
;;   (c-toggle-auto-state)
;;   (c-set-offset 'case-label '+))

;; (add-hook 'c-mode-common-hook 'djm--moose-hook)

(provide 'init)
;;; init.el ends here
