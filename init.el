;;; muh-emacs-config --- Summary
;; steve's init. started over from scratch on 2017-10-15

;;; Commentary:
;; the commentary section is here to make the elisp linter happy.


;;; Code:
;; setup packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/")
             '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;;(toggle-debug-on-quit)
;;(toggle-debug-on-error)

(setq custom-file "~/.emacs.d/site-lisp/custom.el")
(load custom-file)

(let ((default-directory user-emacs-directory))
  (setq load-path
	(append
	 (let ((load-path (copy-sequence load-path)))
	   (append
	    (copy-sequence (normal-top-level-add-to-load-path '("./site-lisp")))
	    (normal-top-level-add-subdirs-to-load-path)))
	 load-path)))

(require 'functions)
(require 'pkgs)
(require 'config)
