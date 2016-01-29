;; init.el
;; load elisp config file
(add-to-list
    `load-path
    (expand-file-name "lisp"user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(require 'init-utils)

;; elpa can automatically load your package config and install the package
(require 'init-elpa)

;; solarized theme
(require 'init-theme)

;; make sure emacs use same parameter as real shell
(require 'init-exec-path)

;; file manager
(require 'init-ido)

;; emacs tabbar
(require 'init-tabbar)

;; emacs markdown
(require 'init-markdown)

;; emacs speedbar
(require 'init-speedbar)

;; emacs org
(require 'init-org)

;; emacs edit-config
(require 'init-editing-utils)

;; emacs ide-config
(require 'init-ide-utils)
;; emacs yasnippet
(require 'init-yasnippet)

;; Config indent-tab
(setq default-tab-width 4)

(setq-default indent-tabs-mode nil)

(setq c-default-style "linux")

(setq c-basic-offset 4)

(provide 'init)
