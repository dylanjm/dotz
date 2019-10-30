;;; early-init.el --- Early initialization. -*- lexical-binding: t; buffer-read-only: t; no-byte-compile: t-*-
;;;
;;; Commentary:
;;; Emacs config by dylanjm
;;; This file was automatically generated by `org-babel-tangle'.
;;; Do not change this file.  Main config is located in emacs.d/dotemacs.org
;;;
;;; Code:

(defvar user-emacs-cache "~/.cache/emacs")

(eval-and-compile
  (defun djm/emacs-path (path)
    (expand-file-name path user-emacs-directory)))

(eval-and-compile
    (defun djm/emacs-cache (path)
           (expand-file-name path user-emacs-cache)))

(defvar default-file-name-handler-alist file-name-handler-alist)
(defvar default-gc-cons-threshold (if (display-graphic-p) 800000 800000))
(defvar extended-gc-cons-threshold (if (display-graphic-p) 400000000 100000000))

(setq-default auto-window-vscroll nil
              file-name-handler-alist nil
              frame-inhibit-implied-resize t
              gc-cons-percentage 0.6
              inhibit-compacting-font-caches t
              package-enable-at-startup nil)

(add-hook 'after-init-hook
          (lambda ()
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold default-gc-cons-threshold)
            (setq gc-cons-percentage 0.1)

            (defun djm/gc-on-lose-focus ()
              (unless (frame-focus-state)
                (garbage-collect)))

            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function #'djm/gc-on-lose-focus))

            (defun djm/minibuffer-setup-hook ()
              (setq gc-cons-threshold extended-gc-cons-threshold))

            (defun djm/minibuffer-exit-hook ()
              (setq gc-cons-threshold default-gc-cons-threshold))

            (add-hook 'minibuffer-setup-hook #'djm/minibuffer-setup-hook)
            (add-hook 'minibuffer-exit-hook #'djm/minibuffer-exit-hook)))

(fset 'yes-or-no-p 'y-or-n-p)
(fset 'view-hello-file 'ignore)
(fset 'display-startup-echo-area-message 'ignore)

(put 'narrow-to-region 'disabled nil)
(put 'up-case-rgion 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

(push '(ns-transparent-titlebar . t) default-frame-alist)
(push '(internal-border . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(font . "-*-Iosevka Nerd Font Mono-ultralight-normal-normal-*-18-*-*-*-m-0-iso10646-1") default-frame-alist)
(push '(variable-pitch . "-*-Fira Sans-light-normal-normal-*-18-*-*-*-p-0-iso10646-1") default-frame-alist)

(with-no-warnings
  (setq straight-cache-autoloads t)
  (setq straight-check-for-modifications 'live-with-find)
  (setq straight-repository-branch "develop")
  (setq straight-use-package-by-default t))

(eval-and-compile
  (defvar bootstrap-version 5)
  (defvar bootstrap-file (djm/emacs-path "straight/repos/straight.el/bootstrap.el")))

(unless (file-exists-p bootstrap-file)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
       'silent 'inhibit-cookies)
    (goto-char (point-max))
    (eval-print-last-sexp)))

(load bootstrap-file nil 'nomessage)

(with-no-warnings
  (setq use-package-verbose t)
  (setq use-package-enable-imenu-support t))

(straight-use-package 'use-package)

(use-package no-littering
  :straight t
  :demand t
  :init
  (setq no-littering-etc-directory (djm/emacs-cache "config/"))
  (setq no-littering-var-directory (djm/emacs-cache "data/"))
  :config
  (setq auto-save-file-name-transforms `((".*" ,(djm/emacs-cache "backups/") t)))
  (setq backup-directory-alist `(("." . ,(djm/emacs-cache "backups/")))))

(use-package dash)
(use-package dash-functional)
(use-package f)
(use-package s)
(use-package memoize)
(use-package general)
(use-package el-patch)
(use-package hydra)
(use-package use-package-chords)
(use-package use-package-ensure-system-package)
(use-package use-package-hydra)
(use-package diminish)
(use-package bind-key)

(provide 'early-init)
;;; early-init.el ends here
