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

;; (use-package projectile
;;   :ensure t
;;   ;; :init
;;   ;; (setq projectile-mode-line
;;   ;;        '(:eval (format " Projectile[%s]"
;;   ;;                        (projectile-project-name))))
;;   :config
;;   (projectile-mode 1)
;;   (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; (use-package helm
;;   :ensure t
;;   :config
;;   (helm-mode 1)
;;   (require 'helm-config)
;;   :bind (("M-p" . helm-find-files)))

(use-package helm
  :diminish helm-mode
  :ensure t
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t))
    ;;replace locate with spotlight - uncomment next 2 lines on Mac
    ;;(setq locate-command "mdfind -name")
    ;;(setq helm-locate-command "mdfind -name %s %s")
  :bind (("C-x f" . helm-for-files)
         ("M-x" . helm-M-x)))

(use-package helm-ls-git
  :ensure t
  :config
  :bind ("C-x C-g" . helm-browse-project))

(use-package better-defaults
  :ensure t)

(use-package company
  :ensure t
  :init
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)

;; (use-package company-jedi
;;   :ensure t
;;   :init
;;   (setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.python-environments")))
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot t)
;;   (setq jedi:use-shortcuts t)
;;   :config
;;   (defun config/enable-company-jedi ()
;;     (add-to-list 'company-backends 'company-jedi))
  
;;   (add-hook 'python-mode-hook 'config/enable-company-jedi)

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
  (global-flycheck-mode 1)
  :init
  (setq flycheck-check-syntax-automatically '(mode-enabled save)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package doom-themes
  :ensure t)

(use-package base16-theme
  :ensure t
  :init
  (load-theme 'base16-material-darker))

(use-package kaolin-themes
  :ensure t)

(use-package avy
  :ensure t
  :bind ("C-c j" . avy-goto-word-or-subword-1))

(use-package dockerfile-mode
  :ensure t)

(use-package highlight-numbers
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))
(provide 'pkgs)

;;; pkgs.el ends here
