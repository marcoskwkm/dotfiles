(require 'tide-setup)

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-offset 2)
  (setq web-mode-enable-auto-quoting nil))

(add-hook 'web-mode-hook  'web-mode-init-hook)
(add-hook 'web-mode-hook #'setup-tide-mode)
(add-hook 'web-mode-hook 'set-tide-keybinds)

(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
