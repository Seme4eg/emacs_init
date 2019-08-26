;; in some reason 3 lines below cannot be put in 'emacs_settings.org' file
(setq user-full-name "sad")
(setq user-mail-address "d3v1ant@mail.ru")
(setenv "SSH_ASKPASS" "git-gui--askpass")

(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)

"Return the full path of *file-relative-path, relative to caller's file location."
(defun get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)

;; make sure package is installed
(unless (package-installed-p 'use-package) ;; if not..
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t) ;; instead of putting ':ensure' everywhere

;; use-package setup
(eval-when-compile
  (require 'use-package))

;; f
;; web-mode
;; htmlize

(org-babel-load-file (get-fullpath "config.org"))

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
    (avy yasnippet-snippets yasnippet swiper popup-kill-ring dmenu diminish spaceline dashboard sudo-edit rainbow-delimiters switch-window evil-mc rainbow rainbow-mode spacemacs-theme org-bullets use-package evil-visual-mark-mode)))
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
