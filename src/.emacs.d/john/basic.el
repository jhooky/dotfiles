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

;; disable prompt for buffers
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; simply 'yes or no' to 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)
