(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; (global-set-key (kbd "C-c C-k") 'compile)


;; === custom functions kbd ===

(global-set-key (kbd "C-x M-t") 'cleanup-region)
;; (global-set-key (kbd "C-c n") 'cleanup-buffer)

;; === end custom functions kbd ===


;; === Leader shortcuts ===

(evil-leader/set-key "RET" 'evil-search-highlight-persist-remove-all)

;; buffers shortcuts
(evil-leader/set-key "l" 'next-buffer)
(evil-leader/set-key "h" 'previous-buffer)
(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "bd" 'kill-buffer)
(evil-leader/set-key "bl" 'list-buffers) ;; how to make it press enter at the end?
(evil-leader/set-key "bo" 'switch-to-buffer)

;; Multiple cursors
(evil-leader/set-key "me" 'mc/edit-lines)
(evil-leader/set-key "mn" 'mc/mark-next-like-this-word)
(evil-leader/set-key "mp" 'mc/mark-previous-like-this-word)
(evil-leader/set-key "ma" 'mc/mark-all-like-this)
(evil-leader/set-key "mf" 'mc/unmark-next-like-this)
(evil-leader/set-key "mb" 'mc/unmark-previous-like-this)
(evil-leader/set-key "md" 'mc/skip-to-next-like-this)
(evil-leader/set-key "mu" 'mc/skip-to-previous-like-this)
(evil-leader/set-key "mt" 'mc/mark-sgml-tag-pair)
(evil-leader/set-key "ms" 'mc/sort-regions)

;; Magit
(evil-leader/set-key "gi" 'magit-init)
(evil-leader/set-key "gs" 'magit-status)


(global-set-key (kbd "M-c") 'evil-normal-state)
