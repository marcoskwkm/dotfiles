(defun my-backward-sentence ()
  (interactive)
  (backward-sentence)
  (recenter))

(defun my-forward-sentence ()
  (interactive)
  (forward-sentence)
  (recenter))
