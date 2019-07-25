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

;; Delete trailing whitespaces on save
(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)
(defun my-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

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
(global-set-key (kbd "s-[") 'previous-multiframe-window)
(global-set-key (kbd "s-]") 'next-multiframe-window)

;; Backups and autosaves
(setq temporary-file-dir "~/.emacs.d/backups/")
(setq
   backup-by-copying t
   backup-directory-alist `(("." . ,temporary-file-dir))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
   auto-save-file-name-transforms `((".*" ,temporary-file-dir t)))
(setq auto-save-list-file-prefix nil) ; Don't generate ~/.emacs.d/auto-save-list/
(setq create-lockfiles nil)           ; Don't generate .#files