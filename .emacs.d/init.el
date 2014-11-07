;;; init.el - lookyhooky

(require 'package)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; packages to install
(defvar packages-list '(better-defaults
			auto-complete
			paredit
                        magit
                        markdown-mode
			use-package
			monokai-theme
			twilight-theme))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install missing packages
(dolist (p packages-list)
  (when (not (package-installed-p p))
    (package-install p)))

;; load all my elisp
(mapc 'load (directory-files (concat user-emacs-directory user-login-name)
                             t "^[^#].*el$"))

(require 'use-package)

(use-package auto-complete
  :init
  (progn
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
    (require 'auto-complete-config)
    (ac-config-default)
    ;; disable ac auto menu
    (setq ac-auto-show-menu nil)))

(use-package paredit
  :diminish paredit-mode
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
    (add-hook 'lisp-mode-hook 'enable-paredit-mode)))

(use-package ido
  :init
  (progn
    (setq ido-enable-flex-matching t)
    (setq ido-use-filename-at-point nil)
    (setq ido-create-new-buffer 'always)
    (ido-mode 1)))

;; My custom settings
(setq custom-file (expand-file-name "~/.emacs.d/custom.el")
      vc-follow-symlinks t
      inhibit-startup-message t
      show-paren-delay 0
      auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory
                                                      "autosaves") t)))

;; load customizations file
(load custom-file t)

;; load theme
(load-theme 'monokai t)

;; increase font size
(set-face-attribute 'default nil :height 140)
