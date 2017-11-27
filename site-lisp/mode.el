;;; mode.el --- mode stuff goes in here

;;; Commentary:
;; this is silly

;;; Code:

(global-hl-line-mode 1)
(projectile-mode)
(setq projectile-mode-line
         '(:eval (format " Projectile[%s]"
                         (projectile-project-name))))

(global-flycheck-mode)
(setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs./.python-environments")))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(defun config/enable-company-jedi ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'config/enable-company-jedi)

(add-hook 'after-init-hook 'global-company-mode)
(pyenv-mode)

(provide 'mode)

;;; mode.el ends here

