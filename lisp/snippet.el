;;;; Saves snippets to a buffer, with comments.
;;;; Author: Petteri Suckman
(defun save-snippet-to-buffer ()
  "Save highlighted part of the text to another buffer with comments"
  (interactive)
  (progn
    (kill-ring-save (point-min) (point-max) t) ;; highlighted text to clipboard
    (switch-to-buffer-other-window "*SNIPPETS*")
    (goto-char (point-max))
    (insert (format-time-string "Snippet added: %Y-%m-%d  %H:%M:%S\n"))
    (insert "****BEGIN_SNIPPET****\n")
    (yank)
    (insert "\n****END_SNIPPET****\n")
    (write-file (concat "~/emacs/snippets/snippet_" (format-time-string "%Y-%m-%d") ".txt"))
    (previous-buffer)
    (message "Moved the snippet to buffer *SNIPPETS*")
    ))

(save-snippet-to-buffer)
