(require 'flycheck)
(require 'lsp)

(setq-default flycheck-c/c++-gcc-executable "/opt/homebrew/bin/gcc-13")
(setq-default flycheck-gcc-language-standard "c++20")
(setq-default flycheck-disabled-checkers '(c/c++-clang))

(defun setup-clang-formatter ()
  (add-hook 'before-save-hook 'clang-format-buffer nil 'local))

(defun setup-flycheck ()
  (flycheck-mode +1)
  (flycheck-select-checker 'c/c++-gcc))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq-local lsp-clients-clangd-library-directories '("/usr", "/opt/homebrew/Cellar/gcc/13.1.0/include/c++/13/aarch64-apple-darwin22/bits"))
            (setup-clang-formatter)
            (setup-flycheck)))

(add-hook 'c++-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'yas-minor-mode)

(setf (lsp-session-folders-blacklist (lsp-session)) nil)
