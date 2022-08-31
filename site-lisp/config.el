;;; config.el --- configuration stuff goes in here

;;; Commentary:
;; this is silly

;;; Code:

;; font stuff
;; (add-to-list 'default-frame-alist '(font . "Input-12"))
;; (set-face-attribute 'default t :font "Input-12")
(global-auto-revert-mode 1)
;; (global-display-line-numbers-mode 1)
(doom-themes-visual-bell-config)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(global-hl-line-mode 1)
(column-number-mode 1)
(global-unset-key (kbd "C-z"))
(delete-selection-mode 1)
(electric-pair-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs-saves")))

(global-set-key (kbd "M-u") 'upcase-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim)

;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)

(defun trl-whitespace-hook ()
  "Show trailing whitespace in the current buffer."
  (setq-local show-trailing-whitespace t))

(add-hook 'prog-mode-hook #'trl-whitespace-hook)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(provide 'config)

;;; config.el ends here
