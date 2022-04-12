(require 'elpy)
(elpy-enable)

(setq elpy-rpc-python-command "python3")

; Disable indentation highlight
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-format-code nil t)))
