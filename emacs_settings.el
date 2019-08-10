"references:
    - http://aaronbedra.com/emacs.d/
    - http://bling.github.io/blog/2013/10/27/emacs-as-my-leader-vim-survival-guide/"

(setq user-full-name "sad")
(setq user-mail-address "d3v1ant@mail.ru")
(setenv "SSH_ASKPASS" "git-gui--askpass")


;; Environment

(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(require 'cl)

;; Splash Screen
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; Turn off Scroll bar, Tool bar, Menu bar

(tool-bar-mode -1)
(menu-bar-mode -1)
(if window-system ;; if in a graphical environment..
    (toggle-scroll-bar -1))

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Display Settings
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; automatically save/restore sessions
(desktop-save-mode 1)

;; Indentation
;; (setq tab-width 2
;;       indent-tabs-mode nil)

;; Backup files
;; (setq make-backup-files nil) -- disable backup files

;; Yes and No
(defalias 'yes-or-no-p 'y-or-n-p)

;; Misc
(setq echo-keystrokes 0.1 ;; Turn down the time to echo keystrokes
      use-dialog-box nil ;; use the echo area instead of dialog boxes
      visible-bell t) ;; Use a visual indicator instead of making horrible noises
(show-paren-mode t) ;; highlight parentheses


;; Vendor directory

;; if you have a couple of things that don't come from package
;; managers. This includes the directory for use.
(defvar sads/vendor-dir (expand-file-name "vendor" user-emacs-directory))
(add-to-list 'load-path sads/vendor-dir)

(dolist (project (directory-files sads/vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; show line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; (setq backup-directory-alist `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq-default show-trailing-whitespace t)

;; shell-script-mode
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;; conf-mode
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))



;; ====================== Themes ======================

(if window-system ;; if in a graphical environment..
    (load-theme 'spacemacs-dark)
  (load-theme 'wombat t)) ;; wombat theme if in a terminal


;; Color Codes
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Change cursor color depending on mode (only GUI emacs)
(setq evil-emacs-state-cursor '("cyan" box))
(setq evil-normal-state-cursor '("cyan" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("green" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("cyan" hollow))

(setq package-enable-at-startup nil)
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
