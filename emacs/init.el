;; Personal libs
(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "packages.el")
(load-library "c.el")
(load-library "transparency.el")
(load-library "latex.el")
(load-library "custom-functions.el")

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
(tool-bar-mode -1)

;; Keybindings
(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "M-p") 'my-backward-sentence)
(global-set-key (kbd "M-n") 'my-forward-sentence)

