;;; init.el --- My init.el  -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Masa-Michi Akashi
;;
;; Author: 
;;
;; this enables this running method
;;   emacs -q -l ~/.debug.emacs.d/init.el
(setq url-proxy-services '(("http" . "proxy2.cgn.canon.co.jp:10080")
                           ("https" . "proxy2.cgn.canon.co.jp:10080")))

(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize))

;; add load path
(setq load-path (append
	'("~/.emacs.d/private-conf")
	load-path))

;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;;
;;(package-install 'js2-mode)
;;(package-install 'helm)
;;(package-install 'company)
;;(package-install 'company-tern)
;;(package-install 'color-theme)


;; ここにいっぱい設定を書く

(provide 'init)
(load-theme 'manoj-dark t)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-r" 'scroll-down)
(global-set-key "\C-x 5" 'split-window-horizontally)

;;
;; make bash as default
;;
(setq shell-file-name "c:/cygwin/bin/bash")
(defun my-shell-setup ()
  "For Cygwin bash under Emacs 20"
  (setq comint-scroll-show-maximum-output 'this)
  (make-variable-buffer-local 'comint-completion-addsuffix))
(setq comint-completion-addsuffix t)
;; (setq comint-process-echoes t) ;; reported that this is no longer needed
(setq comint-eol-on-send t)
(setq w32-quote-process-args ?\")

(setq shell-mode-hook 'my-shell-setup)


;;
;; ls for dired
;;
(setq ls-lisp-use-insert-directory-program t)      ;; use external ls
(setq insert-directory-program "c:/gnuwin32/bin/ls") ;; ls program name

;=======================================================================
; Fonts
;=======================================================================
(set-default-font "Consolas-10")

;=======================================================================
; Misc
;=======================================================================
(mouse-wheel-mode t)                        ;;Wheel Mouse
(global-font-lock-mode t)                    ;;color for fonts
(setq line-number-mode t)                    ;;line number
(auto-compression-mode t)                    ;;Protect Moji-Bake for Japanese
(set-scroll-bar-mode 'right)                    ;;
(setq frame-title-format                    ;; Window Title
    (concat "%b - emacs@" system-name))

(display-time)                            ;;
(global-set-key "\C-h" 'backward-delete-char)            ;;
(setq make-backup-files nil)                    ;;
(setq visible-bell t)                        ;;
;(setq kill-whole-line t)                    ;;
(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))    ;;
;;
;=======================================================================
; Recent files
;=======================================================================
(recentf-mode)
;;
;=======================================================================
; Color for region
;=======================================================================
(setq transient-mark-mode t)
(set-face-background 'region "antique white")
;;
;=======================================================================
; Paren-mode
;=======================================================================
(show-paren-mode)
;;
;=======================================================================
; compile with C-c c
;=======================================================================
(define-key mode-specific-map "c" 'compile)
;;
;=======================================================================
; Automatically add +x mod when save script files
;=======================================================================
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!"
         (buffer-substring-no-properties 1
                         (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char
             (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand
                           (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)
;;
;=======================================================================
; Path
;=======================================================================
(add-to-list 'load-path (expand-file-name "~\\.emacs.d\\elisp\\"))
(add-to-list 'load-path (expand-file-name "~\\.emacs.d\\auto-install\\"))
;;
;=======================================================================
; C++ mode
;=======================================================================

;
; emacsclientを使えるようにする
;
(server-start)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; init.el ends here
