(require 'web-mode)
(require 'lsp)

(setq lsp-tailwindcss-add-on-mode t)
(require 'lsp-tailwindcss)

(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

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

(defun mode-config ()
  (setq lsp-idle-delay 0.2)
  (setq gc-cons-threshold (* 1024 1024 1024)) ;; 1GB
  (setq read-process-output-max (* 300 1024 1024)) ;; 300MB
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-quoting nil))

(defun setup-lsp ()
  (setq-local lsp-ui-doc-show-with-cursor t)
  (setq-local lsp-ui-sideline-enable nil)
  (setf (alist-get 'web-mode lsp--formatting-indent-alist) 'web-mode-code-indent-offset)
  (setq-local lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
  (setq-local lsp-clients-typescript-max-ts-server-memory 2048)
  (lsp))

(add-hook 'web-mode-hook (lambda ()
                           (mode-config)
                           (setup-lsp)
                           (yas-minor-mode)
                           (prettier-js-mode)
                           (eslint-fix-auto-mode)
                           (add-node-modules-path)
                           (lunaryorn-use-js-executables-from-node-modules)))
