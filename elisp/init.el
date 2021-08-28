;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    blacken
    pylint
    flycheck
    material-theme                  ;; Theme
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; Delete whitespace from files.
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Enable robot-mode for Robot Framework file editing
(load-file "/home/$USER/.emacs.d/extend/robot-mode/robot-mode.el")
(add-to-list 'auto-mode-alist '("\\.txt\\'" . robot-mode))

;; Enable Nix-mode
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

;; Modify looks & startup
(setq inhibit-startup-message t)
(set-frame-font 'fira-code-emacs' nil t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
;(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
;(menu-bar-mode -1)          ; Disable the menu bar
(load-theme 'material t)  ; Other good theme: 'misterioso', 'tango-dark'
;;(global-linum-mode t)       ; Show line numbers everywhere

;; Keyboard shortcuts
(global-set-key (kbd "<f5>")  'toggle-truncate-lines) ;; changes between wrapping lines and truncating $
(global-set-key (kbd "C-z") 'shell)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Starts Emacs so that you can just "emacsclient myfile"
;;   to open buffers in the existing session
;;   instead of having different emacs sessions running
(server-mode 1)
