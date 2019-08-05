;; Indentation and buffer cleanup

;; This re-indents, untabifies, and cleans up whitespace
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

"Perform a bunch of operations on the whitespace content of a buffer."
(defun cleanup-buffer ()
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

"Remove tmux artifacts from region."
(defun cleanup-region (beg end)
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

