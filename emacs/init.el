;; Personal libs
(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "packages.el")
(load-library "c.el")
(load-library "custom-functions.el")
(load-library "go.el")
(load-library "latex.el")
(load-library "transparency.el")
(load-library "typescript.el")

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil
              tab-width 4)
(setq shell-command-switch "-lic")
(global-linum-mode 1)
(setq column-number-mode t)
(global-hl-line-mode 1)
(electric-indent-mode 1)
(set-face-background 'default "#202020")
(set-face-foreground 'default "White")
(set-face-background 'hl-line "#003399")
(set-face-attribute 'default nil :height 140) ; Starts emacs with C-x C-= (zoom in)
(tool-bar-mode -1)
(setq exec-path (append exec-path '("/usr/local/bin")))
(global-auto-revert-mode t) ; Auto refreshes buffers on file change

;; Always split vertically
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Keybindings
(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "M-p") 'my-backward-sentence)
(global-set-key (kbd "M-n") 'my-forward-sentence)
(global-set-key (kbd "C-x t") 'toggle-window-split)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (latex-preview-pane go-guru tide tidal graphql-mode graphql go-mode exec-path-from-shell centered-cursor-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
