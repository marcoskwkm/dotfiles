(require 'elpy)
(elpy-enable)

; Disable indentation highlight
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
