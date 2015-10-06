;; Key bindings
(global-set-key (kbd "<f6>")  'sout)   ;; F6 key to get System.out.println()
(global-set-key (kbd "<f5>")  'toggle-truncate-lines) ;; changes between wrapping lines and truncating $
(global-set-key (kbd "<f7>")  'save-snippet-to-buffer)   ;;

;; Whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)
