(require 'typescript-mode)
(require 'web-mode)
(require 'flycheck)
(require 'company)

(require 'tide-setup "~/.emacs.d/config/tide-setup.el")

;; Makes typescript-mode derive from prog-mode
(put 'typescript-mode 'derived-mode-parent 'prog-mode)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(setq typescript-indent-level 2)
(setq js-indent-level 2)

(defun setup-flycheck ()
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(defun lunaryorn-use-js-executables-from-node-modules ()
  "Set executables of JS checkers from local node modules."
  (-when-let* ((file-name (buffer-file-name))
               (root (locate-dominating-file file-name "node_modules"))
               (module-directory (expand-file-name "node_modules" root)))
    (pcase-dolist (`(,checker . ,module) '((javascript-jshint . "jshint")
                                           (javascript-eslint . "eslint")
                                           (javascript-jscs   . "jscs")))
      (let ((package-directory (expand-file-name module module-directory))
            (executable-var (flycheck-checker-executable-variable checker)))
        (when (file-directory-p package-directory)
          (set (make-local-variable executable-var)
               (expand-file-name (concat "bin/" module ".js")
                                 package-directory)))))))


(when (fboundp 'typescript-mode)
  (add-hook 'typescript-mode-hook
            (lambda ()
              (set-tide-keybinds)
              (lunaryorn-use-js-executables-from-node-modules)
              (flycheck-add-mode 'javascript-eslint 'typescript-mode)
              (setup-flycheck)
              (add-node-modules-path)
              (eslint-fix-auto-mode)
              (prettier-js-mode))))
