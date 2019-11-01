;;; early-init.el --- Early initialization. -*- lexical-binding: t; buffer-read-only: t; coding: utf-8-*-
;;;
;;; Commentary:
;;; Emacs `early-init.el' config by dylanjm
;;; This file was automatically generated by `org-babel-tangle'.
;;; Do not change this file.  Main config is located in emacs.d/dotemacs.org
;;;
;;; Code:

(defvar default-file-name-handler-alist file-name-handler-alist)
(defvar extended-gc-cons-threshold 400000000)
(defvar default-gc-cons-threshold 800000)

(setq auto-window-vscroll nil
      file-name-handler-alist nil
      frame-inhibit-implied-resize t
      frame-resize-pixelwise t
      gc-cons-percentage 0.8
      gc-cons-threshold extended-gc-cons-threshold
      inhibit-compacting-font-caches t
      initial-scratch-message ""
      inhibit-startup-echo-area-message t
      inhibit-startup-screen t
      load-prefer-newer t
      message-log-max 10000
      package-enable-at-startup nil)

(add-hook 'after-init-hook
          (lambda ()
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold default-gc-cons-threshold)
            (setq gc-cons-percentage 0.1)
            (setq debug-on-error nil)

            (defun djm/gc-on-lose-focus ()
              (unless (frame-focus-state)
                (save-some-buffers '!)
                (garbage-collect)))

            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function #'djm/gc-on-lose-focus))

            (defun djm/minibuffer-setup-hook ()
              (setq gc-cons-percentage .8)
              (setq gc-cons-threshold extended-gc-cons-threshold))

            (defun djm/minibuffer-exit-hook ()
              (setq gc-cons-percentage .1)
              (setq gc-cons-threshold default-gc-cons-threshold))

            (add-hook 'minibuffer-setup-hook #'djm/minibuffer-setup-hook)
            (add-hook 'minibuffer-exit-hook #'djm/minibuffer-exit-hook)))

(fset 'display-startup-echo-area-message 'ignore)
(fset 'view-hello-file 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'up-case-rgion 'disabled nil)
(put 'erase-buffer 'disabled nil)

(blink-cursor-mode 0)

(push '(window-divider-bottom-width . 1) initial-frame-alist)
(push '(window-divider-right-width . 1) initial-frame-alist)
(push '(window-divider-default-places . t) initial-frame-alist)
(push '(right-divider-width . 1) initial-frame-alist)
(push '(bottom-divider-width . 1) initial-frame-alist)
(push '(width . 188) initial-frame-alist)
(push '(height . 188) initial-frame-alist)


(push '(ns-transparent-titlebar . t) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(internal-border . 0) default-frame-alist)
(push '(ns-appearance . nil) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(right-fringe . 5) default-frame-alist)
(push '(left-fringe . 5) default-frame-alist)

(push '(font . "-*-Iosevka Nerd Font Mono-ultralight-normal-ultracondensed-*-18-*-*-*-m-0-iso10646-1") default-frame-alist)
(push '(variable-pitch . "-*-Iosevka Nerd Font-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1") default-frame-alist)

(global-set-key (kbd "C-g") 'minibuffer-keyboard-quit)
(global-unset-key (kbd "C-z"))

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



(with-no-warnings
  (setq straight-cache-autoloads t)
  (setq straight-check-for-modifications 'live-with-find)
  (setq straight-repository-branch "develop")
  (setq straight-use-package-by-default t))

(with-no-warnings
  (setq use-package-verbose t)
  (setq use-package-enable-imenu-support t))

(eval-and-compile
  (defvar straight-recipes-gnu-elpa-use-mirror t)
  (defvar bootstrap-version 5)
  (defvar bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory)))

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
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "CACHE" "FPATH" "PYENV_ROOT"))
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))



(defvar djm--straight-directory (expand-file-name "straight/" user-emacs-directory))
(defvar djm--emacs-cache (expand-file-name "emacs/" (getenv "CACHE")))
(defvar djm--emacs-etc-cache (expand-file-name "config/" djm--emacs-cache))
(defvar djm--emacs-var-cache (expand-file-name "data/" djm--emacs-cache))
(defvar djm--auto-save-file-cache (expand-file-name "backups/" djm--emacs-var-cache))

(setq no-littering-etc-directory djm--emacs-etc-cache)
(setq no-littering-var-directory djm--emacs-var-cache)
(setq auto-save-file-name-transforms `((".*" ,djm--auto-save-file-cache t)))
(setq backup-directory-alist `((".*" . ,djm--auto-save-file-cache)))
(setq recentf-exclude '(djm--emacs-cache djm--straight-directory "/private/var*"))
(setq custom-file (expand-file-name djm--emacs-etc-cache "custom.el"))

(use-package no-littering :demand t :straight t)

(use-package use-package-ensure-system-package)
(use-package use-package-chords)
(use-package use-package-hydra)
(use-package el-patch)
(use-package bind-key)
(use-package general)
(use-package dash)
(use-package f)
(use-package s)
(use-package hydra)

(use-package map :straight nil)
(use-package org :straight t :defer t) ;load this early to avoid the built-in version

(provide 'early-init)
;;; early-init.el ends here
