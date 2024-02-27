(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t)
  ;;(load-theme 'leuven t)
  )

(use-package olivetti
  :ensure t)

(use-package minions
  :ensure t
  :config
  (minions-mode 1))

(use-package ace-window
  :ensure t
  :bind
  (("M-o" . ace-window)))

(use-package hs-minor-mode
  :config
  :hook
  (prog-mode . hs-minor-mode)
  :bind
  (("C-c f a" . hs-hide-all)
   ("C-c f A" . hs-show-all)
   ("C-c C-f" . hs-toggle-hiding)
   ("C-c f b" . hs-hide-block)
   ("C-c f B" . hs-show-block)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.50)
  :init
  (global-company-mode))

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

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package flymake
  :config
  (setq flymake-no-changes-timeout 0.5)
  :bind
  (("C-c e n" . flymake-goto-next-error)
   ("C-c e p" . flymake-goto-prev-error)
   ("C-c e l" . flymake-show-buffer-diagnostics)
   ("C-c e L" . flymake-show-project-diagnostics)))

(use-package treemacs
  :ensure t
  :bind
  (:map global-map
        ("C-c 0" . treemacs-select-window)
        ("C-c 9" . treemacs)))

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
  :config
  (setq eldoc-idle-delay 0.75
		eldoc-echo-area-prefer-doc-buffer t)
  :bind
  (("C-c l q" . eldoc)))

(use-package eglot
  :config
  (setq eglot-events-buffer-size 0)
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

(use-package rust-ts-mode  
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
;;  (set-face-attribute 'default nil :height 100)

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
 '(custom-safe-themes
   '("18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" default))
 '(package-selected-packages
   '(olivetti zenburn-theme yasnippet-snippets which-key vertico treemacs rust-mode orderless minions marginalia magit js2-mode expand-region corfu consult company))
 '(tab-width 4)
 '(treemacs-width 40)
 '(typescript-ts-mode-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
