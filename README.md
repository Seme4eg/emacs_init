> time to finally add some _README_

# Syntax & references
## References
- [aaron bedra - emacs in 14 days](http://aaronbedra.com/emacs.d/)
- [leader-vim survival guide](http://bling.github.io/blog/2013/10/27/emacs-as-my-leader-vim-survival-guide/)
- [Youtube Emacs playlist (24 vids)](https://www.youtube.com/watch?v=d6iY_1aMzeg&list=PLX2044Ew-UVVv31a0-Qn3dA6Sd_-NyA1n)
- [organizing emacs config](http://ergoemacs.org/emacs/organize_your_dot_emacs.html)

## Syntax
```emacs-lisp
;; (if window-system ...) ;; if in a graphical environment..

:bind ("s-t" . sudo-edit) ;; "s" stands for 'super'
```

### Hooks
Whenever we enter a buffer that is for programming `prog-mode-hook` is called
and when it is called run `rainbow-mode`
So when we enter any buffer for programming hook below is called
``` emacs-lisp
:init (add-hook 'prog-mode-hook 'rainbow-mode))
```

> also check [use-package hooks](https://github.com/jwiegley/use-package#hooks)
