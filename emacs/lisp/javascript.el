(require 'xref-js2)

(defun setup-js2-mode ()
  (interactive)
  (local-set-key (kbd "C-x r") 'xref-find-references))

(add-hook 'js2-mode-hook #'setup-js2-mode)

(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override t)
