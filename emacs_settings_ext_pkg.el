(projectile-mode +1)

(require 'powerline)
(powerline-default-theme)

(require 'auto-complete-config)
(ac-config-default)

(setq dired-dwim-target t)

;; (helm-mode 1)


;; ====================== Smex ======================

;; smex is a necessity. It provides history and searching on top of M-x
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)



;; ============ flyspell (spell checker) ============

(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")



;; ================ eshell (what's that?) ================

(require 'f)

(setq eshell-visual-commands
      '("less" "tmux" "htop" "top" "bash" "zsh" "fish"))

(setq eshell-visual-subcommands
      '(("git" "log" "l" "diff" "show")))

;; Prompt with a bit of help from http://www.emacswiki.org/emacs/EshellPrompt
(defmacro with-face (str &rest properties)
  `(propertize ,str 'face (list ,@properties)))

(defun eshell/abbr-pwd ()
  (let ((home (getenv "HOME"))
        (path (eshell/pwd)))
    (cond
     ((string-equal home path) "~")
     ((f-ancestor-of? home path) (concat "~/" (f-relative path home)))
     (path))))

(defun eshell/my-prompt ()
  (let ((header-bg "#161616"))
    (concat
     (with-face (eshell/abbr-pwd) :foreground "#008700")
     (if (= (user-uid) 0)
         (with-face "#" :foreground "red")
       (with-face "$" :foreground "#2345ba"))
     " ")))

(setq eshell-prompt-function 'eshell/my-prompt)
(setq eshell-highlight-prompt nil)
(setq eshell-prompt-regexp "^[^#$\n]+[#$] ")

(setq eshell-cmpl-cycle-completions nil)



;; ====================== Web-mode ======================

;; web-mode
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))



;; ====================== Markdown Mode ======================

;; Enable Markdown mode and setup additional file extensions
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
;; generate HTML previews from within the mode
(setq markdown-command "pandoc --smart -f markdown -t html")
;; use a custom css file to make it a little prettier
(setq markdown-css-paths `(,(expand-file-name "markdown.css" sads/vendor-dir)))

