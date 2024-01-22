;;; package --- Summary
;; A stab at a reproducible configuration.

;;; Commentary:
;; 1. PACKAGE ARCHIVES and straight.el
;; 2. INSTALL with straight.el
;; 3. CONFIGURE packages with use-package
;; 4. KEYBINDINGS


;;; Code:
;; 1. Set up package archives and straight.el

;; 2023-09-21 Made some breaking changes with https://github.com/rksm/emacs-rust-config/blob/master/init.el
(setq straight-use-package-by-default t
      straight-repository-branch "develop"
      straight-cache-autoloads t
      straight-vc-git-default-clone-depth 1
      straight-check-for-modifications '(check-on-save find-when-checking))

(setq-default straight-recipes-gnu-elpa-use-mirror t
              straight-recipes-emacsmirror-use-mirror t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight.el to install required packages
(straight-use-package 'use-package)

;; 2. Install required packages using straight.el
(straight-use-package 'material-theme)
(straight-use-package 'afternoon-theme)
(straight-use-package 'dockerfile-mode)
(straight-use-package 'python-mode)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'go-mode)
(straight-use-package 'robot-mode)
(straight-use-package 'nix-mode)
(straight-use-package 'cc-mode)
;(straight-use-package 'rust-mode)
(straight-use-package 'rustic)
(straight-use-package 'yasnippet)
(straight-use-package 'helm-xref)
(straight-use-package 'google-c-style)
(straight-use-package 'clang-format)
(straight-use-package 'yaml-mode)
(straight-use-package 'markdown-mode)
(straight-use-package 'pylint)
(straight-use-package 'blacken)
(straight-use-package 'projectile)
(straight-use-package 'neotree)
(straight-use-package 'magit)
(straight-use-package 'notmuch)

;; 3. Configure the packages
(use-package material-theme
  :config
  (load-theme 'afternoon t))    ; Other good themes:
; 'afternoon', 'material' 'misterioso', 'tango-dark'

(use-package dockerfile-mode
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package python-mode
  :mode ("\\.py\\'" . python-mode))

(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :hook (go-mode . lsp-deferred)
  :config
  (setq lsp-gopls-staticcheck t
        lsp-eldoc-render-all t
        lsp-gopls-complete-unimported t))

;; (use-package lsp-mode
  ;; :hook (go-mode . lsp-deferred)
  ;; :hook ((yaml-mode . lsp-deferred))
  ;; :hook ((python-mode . lsp-deferred))
  ;; :hook  (sh-mode . lsp-deferred)
  ;; :hook (c-mode . lsp-deferred)
;;   :commands lsp lsp-deferred
;;   :config
;;   (setq lsp-auto-configure t
;;         lsp-prefer-flymake nil
;;         lsp-enable-snippet t))

;; (use-package lsp-ui
;;   :straight t
;;   :commands lsp-ui-mode
;;   :custom
;;   (lsp-ui-peek-always-show t)
;;   (lsp-ui-sideline-show-hover t)
;;   (lsp-ui-doc-enable nil))

(use-package lsp-mode
  :ensure
  :hook (go-mode . lsp-deferred)
  :hook ((yaml-mode . lsp-deferred))
  :hook ((python-mode . lsp-deferred))
  :hook  (sh-mode . lsp-deferred)
  :hook (c-mode . lsp-deferred)
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  (lsp-inlay-hint-enable t)
  ;; These are optional configurations. See https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/#lsp-rust-analyzer-display-chaining-hints for a full list
  ;(lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :straight t
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))


;; (use-package company
;;   :hook (prog-mode . company-mode)
;;   :config
;;   (setq company-idle-delay 0.5
;;         company-minimum-prefix-length 1
;;         company-tooltip-limit 10))


;; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;; inline errors

(use-package flycheck :ensure)
  :straight t

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.5) ;; how long to wait until popup
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last))
              ("<tab>". tab-indent-or-complete)
	      ("TAB". tab-indent-or-complete))
  (setq lsp-prefer-capf t)

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))


(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))


;; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;; Create / cleanup rust scratch projects quickly

(use-package rust-playground :ensure)


;; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;; for Cargo.toml and other config files

(use-package toml-mode :ensure)


;; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;; setting up debugging support with dap-mode

(use-package exec-path-from-shell
  :ensure
  :init (exec-path-from-shell-initialize))

(when (executable-find "lldb-mi")
  (use-package dap-mode
    :ensure
    :config
    (dap-ui-mode)
    (dap-ui-controls-mode 1)

    (require 'dap-lldb)
    (require 'dap-gdb-lldb)
    ;; installs .extension/vscode
    (dap-gdb-lldb-setup)
    (dap-register-debug-template
     "Rust::LLDB Run Configuration"
     (list :type "lldb"
           :request "launch"
           :name "LLDB::Run"
	   :gdbpath "rust-lldb"
           ;; uncomment if lldb-mi is not in PATH
           ;; :lldbmipath "path/to/lldb-mi"
           ))))

(use-package company-lsp
  :after (company lsp-mode)
  :config
  (setq company-lsp-cache-candidates t
        company-lsp-async t))

(use-package robot-mode
  :mode (("\\.robot\\'" . robot-mode))
  :custom
  (robot-indent-level 4) ; Set indentation level to 4 spaces
  (robot-show-parens t)  ; Highlight matching parentheses
  :hook (robot-mode . company-mode) ; Use company-mode for completion
  :config
  (setq tab-width 4) ; Set tab width to 4 spaces
  (setq indent-tabs-mode nil)) ; Use spaces instead of tabs for indentation

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package yaml-mode
  :mode ("\\.yml\\'" "\\.yaml\\'")
  :hook (yaml-mode . lsp-deferred)
  :config
  (setq tab-width 4)
  (add-hook 'yaml-mode-hook
            (lambda ()
              (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(use-package markdown-mode
  :mode ("\\.md\\'" "\\.markdown\\'")
  :config
  (setq markdown-command "multimarkdown"))


(use-package pylint
  :hook (python-mode . (lambda ()
                         (setq-local flycheck-checker 'python-pylint)
			 (setq pylint-options '("--max-line-length=88"))
                         (flycheck-mode))))

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

;; (use-package rust-mode
;;   :mode ("\\.rs\\'")
;;   :hook (rust-mode . lsp-deferred)
;;   :config 
;;   (setq rust-format-on-save t))

(use-package blacken
  :hook (python-mode . blacken-mode)
  :config
  (setq blacken-executable "~/.pyenv/shims/black"))

(use-package projectile
  :config
  (projectile-mode +1))

(use-package neotree
  :straight t
  :bind ([f8] . neotree-toggle))
(setq projectile-switch-project-action 'neotree-projectile-action)

;; Configure tramp for opening files on remote server
;; for help run "kb tramp"
(setq tramp-default-method "ssh")

;; Managing multiple Python versions with Eshell
;; Emacs command shell

;; N.b. Eshell is not able to use the PATH correctly
;; when you write "pyenv" it does not find.
;; Added absolute path of command to ~/.emacs.d/eshell/alias
;; Maybe because PATH and 'exec-path are two different things?
(use-package eshell
  :config
  (setenv "PYENV_ROOT" "/home/$USER/.pyenv")
  (add-to-list 'exec-path "/home/$USER/.pyenv/bin")
  (setenv "PATH"
          (concat
           "/home/$USER/.pyenv/bin" path-separator
           (getenv "PATH")))
  )

;; Info manual
(defun eshell/info (subject)
  "Read the Info manual on SUBJECT."
  (let ((buf (current-buffer)))
    (Info-directory)
    (let ((node-exists (ignore-errors (Info-menu subject))))
      (if node-exists
          0
        ;; We want to switch back to *eshell* if the requested
        ;; Info manual doesn't exist.
        (switch-to-buffer buf)
        (eshell-print (format "There is no Info manual on %s.\n"
                              subject))
        1))))

(setq c-default-style "google"
      c-basic-offset 4)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(setq clang-format-executable "/usr/bin/clang-format")


;; ORG mode configuration
(load "~/.emacs.d/extend/ob-rust/ob-rust.el")  ;; probably not needed anymore
;; see https://emacs.stackexchange.com/questions/56126/attempting-to-use-org-babel-to-write-literate-rust
(org-babel-do-load-languages 'org-babel-load-languages '(
							 (C . t)
							 (python . t)
							 (shell . t)
							 (rust . t)
							 ))
;; Emacs mail sending
(setq send-mail-function    'smtpmail-send-it
          smtpmail-smtp-server  "mail.nnextdomain.fi"
          smtpmail-stream-type  'ssl
          smtpmail-smtp-service 465
	  smtpmail-local-domain "nndomain.com"
	  user-full-name "N.N."
	  user-mail-address (concat "$USER@" smtpmail-local-domain))

;; My extras
(load "~/.emacs.d/extend/henki/henki.el")

;; 4. UI MODIFICATIONS

(setq inhibit-startup-message t)
(set-frame-font 'fira-code-emacs' nil t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
					;(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar
;;(global-linum-mode t)       ; Show line numbers everywhere

;; Use only visual cue for error, no sound.
(setq visible-bell t)
(setq ring-bell-function 'ignore)


;; Make changing Emacs colour themes easy
;; There are three ways to change:
;; 1. interactive function "toggle-colour-theme"
;; 2. toggle function with "C-c t" keybinding
;; 3. with interactiv function "change-theme". Write the theme name in buffer.

(defvar my-color-themes '(material misterioso tango-dark autumn-light cyberpunk)
  "List of color themes to cycle through.")

(defvar current-theme-index 0
  "Index of the currently selected theme in `my-color-themes` list.")

(defvar current-theme nil
  "Currently selected color theme.")

(defun toggle-colour-theme ()
  "Toggle to the next color theme in the list."
  (interactive)
  (setq current-theme-index (% (1+ current-theme-index) (length my-color-themes)))
  (setq current-theme (nth current-theme-index my-color-themes))
  (load-theme (intern current-theme) t)
  (message "Switched to %s theme" current-theme))

;; Initial theme setup (optional)
(setq current-theme 'cyberpunk) ; Set your initial theme here
(load-theme current-theme t)

(defun change-theme (name)
  "Applies a theme given a theme name."
(interactive "S"
	     (let (name (read-from-minibuffer "Enter theme name")))
	     )
  (setf current-theme name)
  (load-theme name t)
  (message "Theme set to: %s" name)
  )


(defun get-current-theme ()
  (interactive)
    (print current-theme)
)


;; 5. KEYBINDINGS
(global-set-key (kbd "<f6>")  'toggle-truncate-lines) ;; changes between wrapping lines and truncating $
(global-set-key (kbd "C-z") 'eshell)
(global-set-key (kbd "<f5>") 'recompile)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c f") 'clang-format-buffer)
(global-set-key (kbd "<f7>") 'dictionary-lookup-definition)
(global-set-key (kbd "<f9>") 'improve-python-docstring)
(global-set-key (kbd "<f3>") 'rustic-cargo-clippy)
(global-set-key (kbd "C-c t") 'toggle-colour-theme)

;; Starts Emacs so that you can just "emacsclient myfile"
;;   to open buffers in the existing session
;;   instead of having different emacs sessions running
(server-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(notmuch-saved-searches
   '((:name "inbox" :query "tag:inbox" :key "i")
     (:name "unread" :query "tag:unread" :key "u")
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d")
     (:name "all mail" :query "*" :key "a")
     (:name "today-nospam" :query "date:today AND tag:inbox AND NOT tag:spam")
     (:name "since-date-no-spam" :query "date:2023-06-01..today AND not tag:spam AND not tag:promo")
     (:name "important" :query "date:2023-05-14..today AND not tag:archive AND not tag:spam"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here

