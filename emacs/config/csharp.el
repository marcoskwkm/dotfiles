(require 'lsp)
(require 'csharp-mode)

(defun setup ()
  (setq-local lsp-enable-file-watchers nil)
  (setq-local lsp-lens-enable nil)
  (lsp))

(add-hook 'csharp-mode-hook #'setup)
