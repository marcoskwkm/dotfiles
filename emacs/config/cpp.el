(add-hook 'c++-mode-hook
          (lambda ()
            (add-hook (make-local-variable 'before-save-hook)
                      'clang-format-buffer)))
