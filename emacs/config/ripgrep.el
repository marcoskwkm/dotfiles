(require 'ripgrep)

(global-set-key (kbd "C-?") 'ripgrep-regexp)

;; Press 'o' to open file in same buffer as search result
(defun my-compile-goto-error-same-window ()
  (interactive)
  (let ((display-buffer-overriding-action
         '((display-buffer-reuse-window
            display-buffer-same-window)
           (inhibit-same-window . nil))))
    (call-interactively #'compile-goto-error)))

(defun my-compilation-mode-hook ()
  (local-set-key (kbd "o") #'my-compile-goto-error-same-window))

(add-hook 'compilation-mode-hook #'my-compilation-mode-hook)
