;;;;;;;;;;;;;;;;;;;;;;
;; Package managing ;;
;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; Fixes free variable warnings
(defvar langelem nil)

;; List of packages to keep updated
(setq package-list
      '(
        ;; Emacs stuff
        exec-path-from-shell
        add-node-modules-path
        fzf
        ivy
        company
        ;; Utilities
        ripgrep
        ;; Project management
        projectile
        ;; JS
        ag
        js2-mode
        web-mode
        prettier-js
        ;; Typescript
        typescript-mode
        tide
        ;; Go
        go-guru
        go-mode
        ;; Latex
        latex-preview-pane
        ;; Markdown
        markdown-mode
        ;; JSON
        json-mode
        ;; Python
        elpy
        ))

;; Activate all packages
(package-initialize)

;; Fetch the list of available packages
(unless package-archive-contents
  (package-refresh-contents))

;; Install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;;;;;;;;;;;;;;;;
;; Emacs setup ;;
;;;;;;;;;;;;;;;;;

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;
;; Config files ;;
;;;;;;;;;;;;;;;;;;

(defun load-directory (dir)
  "Load all `.el' files in directory."
  (dolist (path (directory-files dir))
    (cond ((and (>= (length path) 3) (string= (substring path -3) ".el"))
	       (load-file (concat dir path))))))

(load-directory "~/.emacs.d/config/")

;;;;;;;;;;;;;;;;
;; Other shit ;;
;;;;;;;;;;;;;;;;

;; Suppress emacs-26 Mojave error
(delete-file "~/Library/Colors/Emacs.clr")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-checker-error-threshold nil)
 '(package-selected-packages
   '(lsp-tailwindcss lsp-ui csharp-mode rainbow-mode dap-mode lsp-mode pyenv-mode xterm-color eslint-fix yaml-mode irony ivy elpy fzf ripgrep json-mode add-node-modules-path prettier-js flycheck web-mode tide tidal latex-preview-pane graphql-mode graphql go-guru exec-path-from-shell centered-cursor-mode ag))
 '(warning-suppress-types '((lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
