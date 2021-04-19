(require 'irony)

(add-hook 'c++-mode-hook 'irony-mode)
(setq irony-additional-clang-options "--std=c++17")
