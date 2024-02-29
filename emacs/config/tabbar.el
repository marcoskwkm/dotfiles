(tab-bar-mode 1)
(global-set-key (kbd "s-{") 'tab-previous)
(global-set-key (kbd "s-}") 'tab-next)
(global-set-key (kbd "C-s-n") 'tab-new)
(global-set-key (kbd "C-s-w") 'tab-close)

(custom-set-faces
 '(tab-bar ((t (:inherit variable-pitch :background "grey20" :foreground "gray90" :height 130))))
 '(tab-bar-tab ((t (:inherit tab-bar :background "gray45" :box (:line-width (1 . 1) :style released-button)))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :background "grey30")))))
