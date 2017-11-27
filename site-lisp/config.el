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
(global-hl-line-mode 1)

(provide 'config)

;;; config.el ends here

