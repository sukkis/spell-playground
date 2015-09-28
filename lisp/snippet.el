;;; Work in progress...
(defun save-snippet-to-buffer ()
  "Save highlighted part of the text to another buffer with comments"
  (interactive)
  (progn
    (kill-ring-save (point-min) (point-max) t) ;; highlighted text to clipboard
    (switch-to-buffer-other-window "*SNIPPETS*")
    (insert (format-time-string "Snippet added: %Y-%m-%d  %H:%M:%S\n"))
    (insert "****BEGIN_SNIPPET****\n")
    (yank)
    (insert "\n****END_SNIPPET****\n")
    (switch-to-buffer (other-buffer -1))
    (message "Moved the snippet to buffer *SNIPPETS*")
    ))

(save-snippet-to-buffer)
