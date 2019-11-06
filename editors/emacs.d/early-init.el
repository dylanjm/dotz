;;; early-init.el --- Early initialization. -*- lexical-binding: t; buffer-read-only: t-*-
;;;
;;; Commentary:
;;; Emacs `early-init.el' config by dylanjm
;;; This file was automatically generated by `org-babel-tangle'.
;;; Do not change this file.  Main config is located in emacs.d/dotemacs.org
;;;
;;; Code:

(defvar default-file-name-handler-alist file-name-handler-alist)
(defvar extended-gc-cons-threshold most-positive-fixnum)
(defvar default-gc-cons-threshold 800000)

(setq file-name-handler-alist nil
      gc-cons-percentage 0.8
      gc-cons-threshold extended-gc-cons-threshold
      inhibit-compacting-font-caches t
      package-enable-at-startup nil)

(defun djm/gc-on-lose-focus ()
  (unless (frame-focus-state)
    (garbage-collect)))

(defun djm/minibuffer-setup-hook ()
  (setq gc-cons-percentage .8)
  (setq gc-cons-threshold extended-gc-cons-threshold))

(defun djm/minibuffer-exit-hook ()
  (setq gc-cons-percentage .1)
  (setq gc-cons-threshold default-gc-cons-threshold))

(defun djm/return-vars-to-normal ()
  (setq file-name-handler-alist default-file-name-handler-alist)
  (setq gc-cons-threshold default-gc-cons-threshold)
  (setq gc-cons-percentage 0.1)
  (setq load-prefer-newer nil)
  (setq debug-on-error nil))

(add-hook 'after-init-hook
          (lambda ()
            (djm/return-vars-to-normal)
            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function #'djm/gc-on-lose-focus))
            (add-hook 'minibuffer-setup-hook #'djm/minibuffer-setup-hook)
            (add-hook 'minibuffer-exit-hook #'djm/minibuffer-exit-hook)))

(fset 'display-startup-echo-area-message 'ignore)
(fset 'view-hello-file 'ignore)

(setq-default auto-window-vscroll nil
      bidi-display-reordering 'left-to-right
      initial-scratch-message ""
      inhibit-startup-echo-area-message t
      inhibit-startup-screen t
      ns-pop-up-frames nil
      ns-use-native-fullscreen nil
      ns-use-thin-smoothing t
      frame-inhibit-implied-resize t
      window-resize-pixelwise t
      frame-resize-pixelwise t)

(push '(window-divider-default-bottom-width . 1) default-frame-alist)
(push '(window-divider-default-right-width . 1) default-frame-alist)
(push '(window-divider-default-places . t) default-frame-alist)
(push '(width . 188) default-frame-alist)
(push '(height . 188) default-frame-alist)
(push '(ns-transparent-titlebar . t) default-frame-alist)
(push '(ns-appearance . dark) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 1) default-frame-alist)
(push '(right-fringe . 5) default-frame-alist)
(push '(left-fringe . 5) default-frame-alist)
(push '(font . "-*-Iosevka Nerd Font Mono-ultralight-normal-normal-*-24-*-*-*-m-0-iso10646-1") default-frame-alist)
(push '(inhibit-double-buffering . t) default-frame-alist)

(prefer-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(set-file-name-coding-system 'utf-8)

(advice-add #'x-apply-session-resources :override #'ignore)

(defvar djm--straight-directory (expand-file-name "straight/" user-emacs-directory))
(defvar djm--emacs-cache "~/.cache/emacs/")
(defvar djm--emacs-etc-cache (expand-file-name "etc/" djm--emacs-cache))
(defvar djm--emacs-var-cache (expand-file-name "var/" djm--emacs-cache))
(defvar djm--custom-file (expand-file-name "custom.el" djm--emacs-etc-cache))
(defvar djm--secret-file (expand-file-name "secret.el" djm--emacs-etc-cache))
(defvar djm--yasnippet-dir (expand-file-name "snippets" user-emacs-directory))
(defvar djm--auto-save-file-cache (expand-file-name "backups/" djm--emacs-var-cache))
(defvar djm--personal-lisp-dir (expand-file-name "lisp/" user-emacs-directory))

(eval-and-compile
  (defvar straight-recipes-gnu-elpa-use-mirror t)
  (defvar bootstrap-version 5)
  (defvar bootstrap-file
    (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory)))

;; Clear out recipe overrides (in case of re-init).
(with-no-warnings
  (setq straight-cache-autoloads t)
  (setq straight-recipe-overrides nil)
  (setq straight-check-for-modifications '(find-when-checking check-on-save))
  (setq straight-repository-branch "develop")
  (setq straight-use-package-by-default t))

(with-no-warnings
  (setq use-package-verbose nil)
  (setq use-package-always-defer t)
  (setq use-package-enable-imenu-support t)
  (setq use-package-compute-statistics t))

(unless (file-exists-p bootstrap-file)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
       'silent 'inhibit-cookies)
    (goto-char (point-max))
    (eval-print-last-sexp)))

(load bootstrap-file nil 'nomessage)
(straight-use-package 'use-package)

(use-package exec-path-from-shell
  :demand t
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "CACHE" "FPATH"))
  (setq exec-path-from-shell-arguments '("-l" "-i"))
  (exec-path-from-shell-initialize))

(use-package no-littering
  :demand t
  :straight t
  :init
  (setq no-littering-etc-directory djm--emacs-etc-cache)
  (setq no-littering-var-directory djm--emacs-var-cache)
  :config
  (setq auto-save-file-name-transforms `((".*" ,djm--auto-save-file-cache t)))
  (setq backup-directory-alist `((".*" . ,djm--auto-save-file-cache)))
  (setq custom-file djm--custom-file)
  (setq recentf-exclude `(,djm--emacs-cache
                          ,djm--straight-directory)))

(use-package use-package-chords :demand t)
(use-package use-package-hydra :demand t)
(use-package el-patch :demand t)
(use-package bind-key :demand t)
(use-package general :demand t)
(use-package dash)
(use-package f)
(use-package s)
(use-package hydra :demand t)

(use-package map :demand t :straight nil)
(use-package gv :demand t :straight nil)
(use-package org :demand t :straight t)

(provide 'early-init)
;;; early-init.el ends here
