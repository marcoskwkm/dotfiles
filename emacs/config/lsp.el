(require 'lsp)

(setq-default lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-show-with-mouse nil)

(add-hook 'lsp-configure-hook (lambda ()
                                (local-set-key (kbd "M-.") 'lsp-ui-peek-find-definitions)))
