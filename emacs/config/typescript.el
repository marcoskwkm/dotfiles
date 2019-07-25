(require 'typescript-mode)
(require 'web-mode)
(require 'flycheck)
(require 'company)

(require 'tide-setup "~/.emacs.d/config/tide-setup.el")

;; Makes typescript-mode derive from prog-mode
(put 'typescript-mode 'derived-mode-parent 'prog-mode)

;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(setq typescript-indent-level 2)
(setq js-indent-level 2)
(when (fboundp 'typescript-mode)
  (defun setup-flycheck ()
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled)))
  (add-hook 'typescript-mode-hook 'set-tide-keybinds)
  (add-hook 'typescript-mode-hook 'setup-flycheck))

;; TSX support
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(flycheck-add-mode 'typescript-tslint 'web-mode)
