;; Set up code folding
(add-hook 'c-mode-common-hook 'hs-minormode)

(add-to-list 'load-path (expand-file-name "lisp/ide-utils" user-emacs-directory))

(require 'init-gtags)

(require 'init-gdb)

(provide 'init-ide-utils)
