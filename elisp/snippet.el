;;;; Saves snippets to a buffer, with comments.
;;;;
;;;; Usage: Highlight text in an Emacs buffer. Press a key combination
;;;; binded to this function. (You need to set that up first.)
;;;;
;;;; Copyright 2015 Petteri Suckman
;;;;
;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License as published by
;;;; the Free Software Foundation, either version 3 of the License, or
;;;; (at your option) any later version.
;;;;
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;;

(defun save-snippet-to-buffer ()
  "Saves highlighted part of the text to another buffer with comments.
  Usage:  Highlight text in an Emacs buffer. Press a key combination
  binded to this function. (You need to set that up first.)"
  (interactive)
  (progn
    (kill-ring-save (point-min) (point-max) t) ;; highlighted text to clipboard
    (switch-to-buffer-other-window "*SNIPPETS*")
    (end-of-buffer)
    (insert (format-time-string "Snippet added: %Y-%m-%d  %H:%M:%S\n"))
    (insert "****BEGIN_SNIPPET****\n")
    (yank)
    (insert "\n****END_SNIPPET****\n")
    (write-file (concat "~/emacs/snippets/snippet_" (format-time-string "%Y-%m-%d__%H_%M_%S") ".txt"))
    (select-window-1)
    (toggle-maximize-buffer)
    (message "Moved the snippet to buffer *SNIPPETS*")
    ))
