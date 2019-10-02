(require 'json-mode)

;; Makes json-mode derive from prog-mode
(put 'json-mode 'derived-mode-parent 'prog-mode)

;; Enables flycheck
(defun setup-flycheck ()
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))
(when (fboundp 'typescript-mode)
  (add-hook 'json-mode-hook 'setup-flycheck))
