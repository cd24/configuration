(require 'package)
(setq package-archives
      '(("elpy" . "https://jorgenschaefer.github.io/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq use-package-always-ensure t)

;; Packages

;;;; Git

(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup))

  )

;;;; Syntax

(use-package flycheck)
(use-package company)
(use-package nlinum
  :config
  (global-nlinum-mode))

;;;; Rust Development

(use-package rust-mode
  :bind (("C-c TAB" . rust-format-buffer)))
(use-package racer
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  :config
  (setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/"))
(use-package cargo
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode))
(use-package flycheck-rust
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;;;; Python

(use-package elpy
	     :config (elpy-enable)
         :init
	     (setq elpy-rpc-timeout 10)
	     (setq elpy-django-server-ipaddr "127.0.0.1")
	     (setq elpy-django-server-port 5555))

;;;; Haskell

(use-package yaml-mode)

(use-package haskell-mode
  :bind (("C-c C-l" . haskell-process-load-or-reload)
	 ("C-c C-z" . haskell-interactive-switch)
	 ("C-c C-n C-t" . haskell-process-do-type)
	 ("C-c C-n C-i" . haskell-process-do-info)
	 ("C-c C-n C-c" . haskell-process-cabal-build)
	 ("C-c C-n c" . haskell-process-cabal)))

(use-package intero
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(global-flycheck-mode)
(package-initialize)