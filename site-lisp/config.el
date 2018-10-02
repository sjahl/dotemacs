;;; config.el --- configuration stuff goes in here

;;; Commentary:
;; this is silly

;;; Code:

;; font stuff
(add-to-list 'default-frame-alist '(font . "Fira Mono-9"))
(set-face-attribute 'default t :font "Fira Mono-9")
(global-auto-revert-mode 1)
;; (global-display-line-numbers-mode 1)
(doom-themes-visual-bell-config)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'base16-material-darker)
;; (global-hl-line-mode 1)
(column-number-mode 1)
(global-unset-key (kbd "C-z"))

(provide 'config)

;;; config.el ends here
