(require 'flycheck)
(require 'lsp)

(setq-default flycheck-c/c++-gcc-executable "/usr/local/bin/gcc-9")
(setq-default flycheck-gcc-language-standard "c++17")
(setq-default flycheck-disabled-checkers '(c/c++-clang))

(defun setup-clang-formatter ()
  (add-hook (make-local-variable 'before-save-hook)
            'clang-format-buffer))

(defun setup-flycheck ()
  (flycheck-mode +1)
  (flycheck-select-checker 'c/c++-gcc))

(add-hook 'c++-mode-hook
          (lambda ()
            (setup-clang-formatter)
            (setup-flycheck)))

(add-hook 'c++-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'yas-minor-mode)
