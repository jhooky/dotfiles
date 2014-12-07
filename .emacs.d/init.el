;;; init.el - lookyhooky

(require 'package)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; packages to install
(defvar packages-list '(better-defaults
			auto-complete
			paredit
			use-package))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install missing packages
(dolist (p packages-list)
  (when (not (package-installed-p p))
    (package-install p)))

;; load all my elisp -- disabled
;; (mapc 'load (directory-files (concat user-emacs-directory user-login-name)
;;                              t "^[^#].*el$"))

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

(use-package flymake-ruby
  :init
  (progn
    (add-hook 'ruby-mode-hook 'flymake-ruby-load)))

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
      mouse-wheel-mode t
      show-paren-delay 0
      auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory
                                                      "autosaves") t)))

;; load customizations file
(load custom-file t)

;; indent inside parens like every where else
(setq ruby-deep-indent-paren nil)

;; increase font size
(set-face-attribute 'default nil :height 140)

;; functions
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

;; keybindings
(global-set-key (kbd "M-o") 'smart-open-line)
(global-set-key (kbd "M-O") 'smart-open-line-above)

;; the rest
;; store all backup and autosave files in the tmp dir
;; commented out backup-directory, defined differently in better-defaults.el
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; frame size when windowed
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 80) (height . 42)))

;; org-mode settings
(setq org-log-done t)

;; disable prompt for buffers
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; simply 'yes or no' to 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)
