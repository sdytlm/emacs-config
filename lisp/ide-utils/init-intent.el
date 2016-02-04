;; Config default indent-tab
(setq default-tab-width 8)

(setq c-default-style "linux")

(setq c-basic-offset 4)

;; linux style
(defun set-linux-style()
  (interactive)
  (setq c-default-sytle "linux")
  (setq default-tab-width 8)
  (setq c-basic-offset 8)
)

;; GNU style
(defun set-gnu-style()
  (interactive)
  (setq c-default-style "linux")
  (setq default-tab-width 4)
  (setq c-basic-offset 4)
  )

;; newline behavior
(global-set-key (kbd "RET") 'newline-and-indent)

(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)


;; Smart tab/spaces detection
;; if source code use spaces as indent, disalbe indent-tabs-mode
;; otherwise, enable indent-tabs-mode
(defun how-many-region (begin end regexp &optional interactive)
  "Print number of non-trivial matches for REGEXP in region.                    
Non-interactive arguments are Begin End Regexp"
  (interactive "r\nsHow many matches for (regexp): \np")
  (let ((count 0) opoint)
    (save-excursion
      (setq end (or end (point-max)))
      (goto-char (or begin (point)))
      (while (and (< (setq opoint (point)) end)
                  (re-search-forward regexp end t))
        (if (= opoint (point))
            (forward-char 1)
          (setq count (1+ count))))
      (if interactive (message "%d occurrences" count))
      count)))

(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if        
  ;; neither, we use the current indent-tabs-mode                               
  (let ((space-count (how-many-region (point-min) (point-max) "^  "))
        (tab-count (how-many-region (point-min) (point-max) "^\t")))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(infer-indentation-style)

(provide 'init-intent)
