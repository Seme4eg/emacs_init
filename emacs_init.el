;; ref: http://ergoemacs.org/emacs/organize_your_dot_emacs.html

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

;; after changing file below go to the end of this line and 'C-x C-e'
(org-babel-load-file (get-fullpath "emacs_settings.org"))


;; use-package setup

(eval-when-compile
  (require 'use-package))

;; function, that makes sure that the package is installed
(unless (package-installed-p 'use-package) ;; if package is not installed..
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t) ;; instead of putting ':ensure' everywhere

;; ==========


;; === load packages ===

;; Define default packages
(defvar sads/packages '(evil
			evil-leader
			multiple-cursors
			projectile
			helm-projectile
			helm
			spacemacs-theme
			magit
			org
			powerline

			auto-complete
			htmlize
			writegood-mode
			yasnippet
			markdown-mode
			f
			smex
			web-mode)
  "Default packages")


;; Install default packages

(defun sads/packages-installed-p ()
  (loop for pkg in sads/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (sads/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg sads/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; =====================

;; load files
(load (get-fullpath "emacs_settings_ext_pkg"))
(org-babel-load-file (get-fullpath "emacs_ext_pkg_set.org"))
(load (get-fullpath "emacs_funcs"))
(org-babel-load-file (get-fullpath "emacs_kbd.org"))
;; (load (get-fullpath "emacs_kbd_mode_specific"))
;; (load (get-fullpath "emacs_file_association"))
;; (load (get-fullpath "emacs_html"))
;; (load (get-fullpath "emacs_misc")) ;; catch all, misc / tmp / worry-later


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
