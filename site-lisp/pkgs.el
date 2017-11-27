;;; pkgs.el --- install all my packages

;;; Commentary:
;; this is still a work in progress

;;; Code:

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
(require 'use-package))

(use-package exec-path-from-shell
             :ensure t)

(use-package projectile
             :ensure t)

(use-package better-defaults
             :ensure t)

(use-package company
  :ensure t)

(use-package company-jedi
             :ensure t)

(use-package yaml-mode
             :ensure t)

(use-package markdown-mode
             :ensure t)

(use-package magit
             :ensure t)

(use-package pyenv-mode
             :ensure t)

(use-package flycheck
             :ensure t)

(use-package expand-region
             :ensure t)

(use-package doom-themes
             :ensure t)

(provide 'pkgs)

;;; pkgs.el ends here
