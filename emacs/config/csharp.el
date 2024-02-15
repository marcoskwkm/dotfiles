(require 'lsp)
(require 'csharp-mode)

(defun csharp--setup ()
  (setq-local lsp-enable-file-watchers nil)
  (setq-local lsp-lens-enable nil)
  (lsp))

(add-hook 'csharp-mode-hook #'csharp--setup)
