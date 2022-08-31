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
      (setq exec-path-from-shell-arguments nil)
      (exec-path-from-shell-initialize))))

(use-package delight
  :ensure t)

(use-package projectile
  :delight '(:eval (concat " " (projectile-project-name)))
  :ensure t
  ;; :init
  ;; (setq projectile-mode-line
  ;;        '(:eval (format " Projectile[%s]"
  ;;                        (projectile-project-name))))
  :config
  (projectile-mode 1)
  ;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

(use-package ripgrep
  :ensure t)

(use-package better-defaults
  :ensure t)

(use-package company
  :delight company-mode
  :ensure t
  :init
  (setq company-minimum-prefix-length 2
      company-idle-delay 0.0) ;; default is 0.2
  (add-hook 'prog-mode-hook 'company-mode))

(use-package yaml-mode
  :ensure t
  :init
  (add-hook 'yaml-mode-hook #'trl-whitespace-hook)
  (add-hook 'yaml-mode-hook #'lsp-deferred))

(use-package markdown-mode
  :ensure t)

(use-package terraform-mode
  :ensure t)

(use-package magit
  :ensure t)

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
  :init)

(use-package kaolin-themes
  :ensure t
  :init
  (load-theme 'kaolin-dark))

(use-package dockerfile-mode
  :ensure t)

(use-package highlight-numbers
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (setq lsp-keymap-prefix "C-c l")
  ;; (setq lsp-enable-flycheck t
  ;;       lsp-enable-eldoc t
  ;;       lsp-enable-completion-at-point t
  ;;       lsp-auto-guess-root t
  ;;       lsp-print-io t)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (add-hook 'terraform-mode-hook #'lsp-deferred)
)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package which-key
  :ensure t)

(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook #'lsp-deferred)

  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hooks 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))


(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package pyvenv
  :ensure t)

(use-package vterm
  :ensure t)

(use-package ns-auto-titlebar
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (ns-auto-titlebar-mode t))

(use-package zig-mode
  :ensure t)

(use-package git-gutter
  :ensure t
  :hook ((prog-mode . git-gutter-mode)
         (conf-mode . git-gutter-mode))
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :ensure t
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package ivy
  :demand
  :ensure t
  :init (ivy-mode t)
  :config
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-count-format "%d/%d "))

(use-package counsel
  :ensure t
  :after ivy
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x C-g") 'counsel-git)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "s-r") 'counsel-imenu)
  (global-set-key (kbd "s-F") 'counsel-rg))

(use-package swiper
  :after ivy
  :ensure t)

(provide 'pkgs)

;;; pkgs.el ends here dude
