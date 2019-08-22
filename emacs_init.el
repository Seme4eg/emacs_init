;; in some reason 3 lines below cannot be put in 'emacs_settings.org' file
(setq user-full-name "sad")
(setq user-mail-address "d3v1ant@mail.ru")
(setenv "SSH_ASKPASS" "git-gui--askpass")

(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

"Return the full path of *file-relative-path, relative to caller's file location."
(defun get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)

;; use-package setup
(eval-when-compile
  (require 'use-package))

;; make sure package is installed
(unless (package-installed-p 'use-package) ;; if not..
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t) ;; instead of putting ':ensure' everywhere

;; auto-complete
;; yasnippet
;; f
;; web-mode

;; htmlize
;; writegood-mode

;; load files
(org-babel-load-file (get-fullpath "config.org"))

(custom-set-variables)
(custom-set-faces)
