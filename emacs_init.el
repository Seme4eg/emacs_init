;; ref: http://ergoemacs.org/emacs/organize_your_dot_emacs.html

(require 'package)
(package-initialize)

(require 'ido)

"Return the full path of *file-relative-path, relative to caller's file location."
(defun get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)

(load (get-fullpath "emacs_settings")) ;; emacs settings


;; === load packages ===

(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Define default packages
(defvar sads/packages '(auto-complete
			evil
			evil-leader
			multiple-cursors
			projectile
			helm-porjectile
			helm
			spacemacs-theme
			magit
			org
			powerline

			htmlize
			writegood-mode
			yasnippet
			evil-search-highlight-persist
			autopair
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
(load (get-fullpath "emacs_funcs"))
(load (get-fullpath "emacs_kbd"))
;; (load (get-fullpath "emacs_kbd_mode_specific"))
;; (load (get-fullpath "emacs_file_association"))
;; (load (get-fullpath "emacs_html"))
(load (get-fullpath "emacs_misc")) ;; catch all, misc / tmp / worry-later

