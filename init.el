;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles

;;; Code:
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;start jacob stuff here

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(toggle-frame-maximized)

;;add melpa
(require 'package)

;;(add-to-list 'package-archives
;;             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
;;Can't use the stable because it doesnt have evil
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(global-flycheck-mode)

;; Turn off scrol bars
(scroll-bar-mode -1)

(require 'goto-chg)

;;VIM
(evil-mode 1)

;;Python stuff
(elpy-enable)

;;paredit
(paredit-mode)
(evil-paredit-mode)

;;Custom
(defun open-in-browser (file-name &optional wildcards)
  (interactive
   (find-file-read-args "Find file: "
                        (confirm-nonexistent-file-or-buffer)))
  (shell-command (concat "firefox-trunk " file-name)))

;;tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(global-auto-complete-mode)

;;parens
(global-dummyparens-mode)

;;;init.el ends here
