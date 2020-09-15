(require 'tide-setup)


(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-auto-quoting nil))

(add-hook 'web-mode-hook  'web-mode-init-hook)
(add-hook 'web-mode-hook #'setup-tide-mode)
(add-hook 'web-mode-hook 'set-tide-keybinds)

(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))

;; Prettier
(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(add-hook 'web-mode-hook #'(lambda ()
                             (enable-minor-mode
                              '("\\.(jsx?|tsx?)\\'" . prettier-js-mode))))
(eval-after-load 'web-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)
       (add-hook 'web-mode-hook 'hs-minor-mode))) ;; Activates hide-show mode (for folding)
