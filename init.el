
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)



(use-package minions
  :ensure t
  :config
  (minions-mode 1))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)  
  :config
  (setq corfu-auto t))

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

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package treemacs
  :ensure t
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("M-9" . treemacs)))

(use-package magit
  :ensure t)

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t)
  :hook
  (rust-mode . eglot-ensure))

(use-package emacs
  :init
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (desktop-save-mode 1)
  (setq
   tab-always-indent 'complete)
  ;; treesitter remap
  (setq major-mode-remap-alist
	'((js-mode . js-ts-mode)
 	  (js2-mode . js-ts-mode)
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
   '(rust-mode magit marginalia vertico orderless corfu minions)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
