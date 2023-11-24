(require 'web-mode)
(require 'lsp)
(require 'add-node-modules-path)

(setq lsp-tailwindcss-add-on-mode t)
(require 'lsp-tailwindcss)

(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

(defun mode-config ()
  (setq tab-width 2)
  (setq lsp-idle-delay 0.2)
  (setq gc-cons-threshold (* 1024 1024 1024)) ;; 1GB
  (setq read-process-output-max (* 300 1024 1024)) ;; 300MB
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-quoting nil)
  (setq add-node-modules-path-command '("yarn bin")))

(defun setup-lsp ()
  (setq-local lsp-ui-doc-show-with-cursor t)
  (setq-local lsp-ui-sideline-enable nil)
  (setf (alist-get 'web-mode lsp--formatting-indent-alist) 'web-mode-code-indent-offset)
  (setq-local lsp-clients-typescript-server-args '("--stdio"))
  (setq-local lsp-clients-typescript-max-ts-server-memory 2048)
  (setq-local lsp-javascript-completions-complete-function-calls nil)
  (setq-local lsp-restart 'auto-restart)
  (setq-local lsp-eslint-auto-fix-on-save t)
  (add-hook 'before-save-hook 'lsp-eslint-fix-all nil 'local)
  (lsp))

(add-hook 'web-mode-hook (lambda ()
                           (mode-config)
                           (setup-lsp)
                           (yas-minor-mode)
                           (prettier-js-mode)
                           (add-node-modules-path)))
