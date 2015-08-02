;;; speck-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "speck" "speck.el" (21646 7564 0 0))
;;; Generated autoloads from speck.el

(autoload 'speck-mode "speck" "\
Toggle `speck-mode'.
With prefix ARG, turn speck-mode on if and only if ARG is
positive.  Turning on speck-mode will spell-check (\"speck\") all
windows showing the current buffer.

Global bindings (customizable via `speck-mode-keys').

\\{speck-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'speck-buffer "speck" "\
Toggle `speck-mode' for current buffer.
With non-numeric prefix argument ARG prompt for (new)
dictionary.  With prefix argument ARG zero use the default
dictionary.  With ARG any other number use the corresponding
entry from `speck-dictionary-names-alist'.

\(fn &optional ARG)" t nil)

(autoload 'speck-multi-read "speck" "\
Convert annotations to properties.
BEGIN and END denote the region to convert.

\(fn BEGIN END)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; speck-autoloads.el ends here
