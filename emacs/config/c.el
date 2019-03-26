(defvaralias 'c-basic-offset 'tab-width)
(setq c-default-style "linux")
(c-set-offset 'case-label '+) ; indents switch-case block

;; For fixing indentation with C++ lambda functions
(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (ignore-errors
                   (save-excursion
                     (goto-char (c-langelem-pos langelem))
                     ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                     ;;   and with unclosed brace.
                     (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior
