;; ----------------------------------------------------
;; init.el --- Minimal, beginner-friendly Evil setup
;; ----------------------------------------------------

;; --------------------
;; Package management
;; --------------------
(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Ensure required packages are installed
(dolist (pkg '(evil evil-collection))
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; --------------------
;; Basic UI cleanup
;; --------------------
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

;; Make ESC quit things consistently
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; --------------------
;; Evil configuration
;; --------------------
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump nil)
(setq evil-undo-system 'undo-redo)

(require 'evil)
(evil-mode 1)

(require 'evil-collection)
(evil-collection-init)

;; --------------------
;; Simple leader key
;; --------------------
(evil-set-leader 'normal (kbd "SPC"))
(evil-set-leader 'visual (kbd "SPC"))

(evil-define-key 'normal 'global
  (kbd "<leader> f f") 'find-file
  (kbd "<leader> b b") 'switch-to-buffer
  (kbd "<leader> w w") 'save-buffer
  (kbd "<leader> q q") 'save-buffers-kill-terminal)

;; --------------------
;; Sensible defaults
;; --------------------
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq confirm-kill-emacs 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
