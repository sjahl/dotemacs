;;; config.el --- configuration stuff goes in here

;;; Commentary:
;; this is silly

;;; Code:

(if window-system
    (progn
      (exec-path-from-shell-initialize)))

(require 'better-defaults)
(load-theme 'doom-tomorrow-night)
(global-auto-revert-mode 1)
(doom-themes-visual-bell-config)

;; keybindings
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'config)

;;; config.el ends here

