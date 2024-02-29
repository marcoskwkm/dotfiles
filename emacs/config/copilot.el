(load-file "~/.emacs.d/copilot/copilot-balancer.el")
(load-file "~/.emacs.d/copilot/copilot.el")

(require 'copilot)

(define-key copilot-completion-map (kbd "C-<return>") 'copilot-accept-completion)
(setq copilot-indent-offset-warning-disable t)

(add-hook 'prog-mode-hook 'copilot-mode)
