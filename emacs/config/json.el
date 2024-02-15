(require 'json-mode)

(message "hi")

;; Makes json-mode derive from prog-mode
(put 'json-mode 'derived-mode-parent 'prog-mode)

(defun json--mode-config ()
  (message "Hello, world!")
  (setq tab-width 2)
  (setq js-indent-level 2))

;; Enables flycheck
(defun json--setup-flycheck ()
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(add-hook 'json-mode-hook (lambda ()
                            (json--mode-config)
                            (json--setup-flycheck)))
