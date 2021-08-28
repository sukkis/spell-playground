;; Initialize package sources
(require 'package)


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Delete whitespace from files.
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Enable robot-mode for Robot Framework file editing
(load-file "/home/$USER/.emacs.d/extend/robot-mode/robot-mode.el")
(add-to-list 'auto-mode-alist '("\\.txt\\'" . robot-mode))

;; Enable Nix-mode
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

;; Need a linter for python. Pylint?

;; Jedi Python auto-completion package -- this is buggy
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)                 ; optional

;; Modify looks & startup
(setq inhibit-startup-message t)
(set-frame-font 'fira-code-emacs' nil t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
;(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar
(load-theme 'tango-dark t)  ; Other good theme: 'misterioso'


;; Keyboard shortcuts
(global-set-key (kbd "<f5>")  'toggle-truncate-lines) ;; changes between wrapping lines and truncating $
(global-set-key (kbd "C-z") 'shell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;
 ;; Took away Jedi 2021-08-25 due to it being buggy.
 '(package-selected-packages (quote (flycheck virtualenv nix-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Starts Emacs so that you can just "emacsclient myfile"
;;   to open buffers in the existing session
;;   instead of having different emacs sessions running
(server-mode 1)
