;;; config.el --- configuration stuff goes in here

;;; Commentary:
;; this is silly

;;; Code:

;; font stuff
(add-to-list 'default-frame-alist '(font . "Fira Mono-9"))
(set-face-attribute 'default t :font "Fira Mono-9")
(global-auto-revert-mode 1)
(global-linum-mode 1)
(doom-themes-visual-bell-config)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'iceberg)
;; (global-hl-line-mode 1)

(provide 'config)

;;; config.el ends here
