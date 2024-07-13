(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package minions
  :ensure t
  :config
  (minions-mode 1))

(use-package ace-window
  :ensure t
  :bind
  (("M-o" . ace-window)))

(use-package corfu
  :ensure t)

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (setq read-extended-command-predicate
        #'command-completion-default-include-p))

(use-package consult
  :ensure t
  :bind
  (("C-c g" . consult-git-grep)
   ("C-s" . consult-line)))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package flymake
  :config
  (setq flymake-no-changes-timeout 0.5)
  :bind
  (("C-c e n" . flymake-goto-next-error)
   ("C-c e p" . flymake-goto-prev-error)
   ("C-c e l" . flymake-show-buffer-diagnostics)
   ("C-c e L" . flymake-show-project-diagnostics)))


(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t))

(use-package eldoc
  :bind
  (("C-c l q" . eldoc)))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) .
		 ("rust-analyzer" :initializationOptions (:check (:command "clippy")))))
  :bind
  (("C-c l f" . eglot-format)
   ("C-c l a" . eglot-code-actions)
   ("C-c l r" . eglot-rename))
  :hook
  (java-ts-mode . eglot-ensure)
  (rust-ts-mode . eglot-ensure)
  (typescript-ts-mode . eglot-ensure))

(use-package rust
  :bind
  (:map rust-ts-mode-map
	("C-c r c" . rust-compile)
	("C-c r k" . rust-check)
	("C-c r t" . rust-test)))

(use-package compilation-mode
  :hook (compilation-filter . ansi-color-compilation-filter)) 

(use-package js2-mode
  :ensure t)

(use-package typescript-ts-mode
  :mode "\\.ts\\'")

(use-package emacs
  :init
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (desktop-save-mode 1)
  (display-line-numbers-mode 1)
  (set-face-attribute 'default nil :height 100)
  
  ;; treesitter remap
  (setq major-mode-remap-alist
	'((js-mode . js-ts-mode)
 	  (js2-mode . js-ts-mode)
	  (java-mode . java-ts-mode)
	  (c-mode . c-ts-mode)
	  (typescript-mode . typescript-ts-mode)
	  (python-mode . python-ts-mode)
	  (rust-mode . rust-ts-mode)))

  ;; backups
  (setq backup-directory-alist `(("." . "~/.saves"))
	backup-by-copying t
	delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2
	version-control t))

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(js2-mode rust-mode which-key magit marginalia consult vertico orderless ace-window minions zenburn-theme exec-path-from-shell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
