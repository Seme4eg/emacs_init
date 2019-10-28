(setenv "SSH_ASKPASS" "git-gui--askpass")

;; increase the cache before starting garbage collection
(setq gc-cons-threshold 50000000)

;; remove the warnings from the GnuTLS library when using HTTPS…
;; increase the minimum prime bits size:
(setq gnutls-min-prime-bits 4096)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))
;; ("marmalade" . "http://marmalade-repo.org/packages/")
(package-initialize)
(package-refresh-contents)

"Return the full path of *file-relative-path, relative to caller's file location."
(defun get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)

;; htmlize

(org-babel-load-file (get-fullpath "config/config.org"))
;; (load (get-gullpath "modes.el"))
;; (load "~/.emacs.d/modes.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (direx ggtags flx counsel wrap-region js2-mode company avy yasnippet-snippets yasnippet swiper popup-kill-ring dmenu diminish spaceline dashboard sudo-edit rainbow-delimiters switch-window evil-mc rainbow rainbow-mode spacemacs-theme org-bullets use-package evil-visual-mark-mode)))
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 103 :width normal :foundry "outline" :family "Source Code Pro")))))

;; (require 'custom)
