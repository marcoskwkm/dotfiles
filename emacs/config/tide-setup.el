(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(defun set-tide-keybinds ()
  (interactive)
  (local-set-key (kbd "C-x r") 'tide-references)
  (local-set-key (kbd "C->") 'tide-references))

(provide 'tide-setup)
