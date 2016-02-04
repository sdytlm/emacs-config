;; Set up code folding

(add-to-list 'load-path (expand-file-name "lisp/ide-utils" user-emacs-directory))

(require 'init-intent)

(require 'init-gtags)

(require 'init-gdb)

(provide 'init-ide-utils)
