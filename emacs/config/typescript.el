(require 'typescript-mode)
(require 'web-mode)
(require 'flycheck)
(require 'company)

;; Makes typescript-mode derive from prog-mode
(put 'typescript-mode 'derived-mode-parent 'prog-mode)

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
(when (fboundp 'typescript-mode)
  (defun ts-config ()
    (local-set-key (kbd "C-x r") 'tide-references)
    (local-set-key (kbd "C->") 'tide-references)
  )
  (add-hook 'typescript-mode-hook 'ts-config)
)

;; TSX support
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(flycheck-add-mode 'typescript-tslint 'web-mode)
