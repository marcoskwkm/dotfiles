(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(setq typescript-indent-level 2)
(setq js-indent-level 2)
(load "~/emacs/typescript.el")
(when (fboundp 'typescript-mode)
  (defun ts-config ()
    (local-set-key (kbd "C-x r") 'tide-references)
    (local-set-key (kbd "C->") 'tide-references)
  )
  (add-hook 'typescript-mode-hook 'ts-config)
)
