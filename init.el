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
;;(evil-mode 1)

;;Python stuff ;;turned off, don't need now
(elpy-enable)

;;paredit ;;also turned off, not using lisp and don't remember how paredit works
;;(paredit-mode)
;;(evil-paredit-mode)

;;Custom
(defun open-in-browser (file-name &optional wildcards)
  (interactive
   (find-file-read-args "Find file: "
                        (confirm-nonexistent-file-or-buffer)))
  (shell-command (concat "firefox-trunk " file-name)))

;;tern;; looking at this years later, I have no idea what this does
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(global-auto-complete-mode)

;;parens ;;turned this off in case it was causing problems... TBD
;;(global-dummyparens-mode)

;;set python interpereter to run with "M-x run-python"
 (setq python-shell-interpreter "ipython3"
       python-shell-interpreter-args "-i")

;;Coq things:
;; This next line makes imports work...
(setq coq-compile-before-require t)

;;;init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (proof-general company-coq melpa-upstream-visit tern-auto-complete slime-volleyball rainbow-delimiters magit js2-mode flycheck evil-paredit elpy dummyparens))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
