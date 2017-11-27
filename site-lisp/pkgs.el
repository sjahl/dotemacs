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
  :ensure t
  :config
  (if window-system
    (progn
      (exec-path-from-shell-initialize))))

(use-package projectile
  :ensure t
  :init
  (setq projectile-mode-line
         '(:eval (format " Projectile[%s]"
                         (projectile-project-name))))
  :config
  (projectile-mode 1))

(use-package better-defaults
  :ensure t)

(use-package company
  :ensure t)

(use-package company-jedi
  :ensure t
  :init
  (setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs./.python-environments")))
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  :config
  (defun config/enable-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'config/enable-company-jedi)

  (add-hook 'after-init-hook 'global-company-mode))

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package pyenv-mode
  :ensure t
  :config
  (pyenv-mode 1))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode 1))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package doom-themes
  :ensure t)

(provide 'pkgs)

;;; pkgs.el ends here
