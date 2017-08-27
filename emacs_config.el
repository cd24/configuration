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

;;;; Git

(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)))

;;;; Syntax

(use-package flycheck)
(use-package company)
(use-package nlinum
  :config
  (global-nlinum-mode))

;;;; Rust

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

(defcustom python-autopep8-path (executable-find "autopep8")
  "autopep8 executable path."
  :group 'python
    :type 'string)

(defun python-autopep8 ()
    "Automatically formats Python code to conform to the PEP 8 style guide.
$ autopep8 --in-place --aggressive --aggressive <filename>"
    (interactive)
    (when (eq major-mode 'python-mode)
      (shell-command
       (format "%s --in-place --aggressive %s" python-autopep8-path
	       (shell-quote-argument (buffer-file-name))))
          (revert-buffer t t t)))

(use-package elpy
  :config (elpy-enable)
  :init
  (setq elpy-rpc-timeout 10)
  (setq elpy-django-server-ipaddr "127.0.0.1")
  (setq elpy-django-server-port 5555))
(use-package py-autopep8
  :bind
  (("C-c C-a" . python-auto-format))
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (setq py-autopep8-options '("--max-line-length=200"))
  :init
  (add-hook 'before-save-hook 'python-autopep8))

;;;; Haskell

(use-package yaml-mode)

(use-package haskell-mode
  :bind (("C-c C-l" . haskell-process-load-or-reload)
	 ("C-c C-z" . haskell-interactive-switch)
	 ("C-c C-n C-t" . haskell-process-do-type)
	 ("C-c C-n C-i" . haskell-process-do-info)
	 ("C-c C-n C-c" . haskell-process-cabal-build)
	 ("C-c C-n c" . haskell-process-cabal))
  :config
  (custom-set-variables
   '(haskell-indentation-where-post-offset 1)
   '(haskell-interactive-mode-hide-multi-line-errors nil)
   '(haskell-process-prompt-restart-on-cabal-change nil)
   '(haskell-process-suggest-remove-import-lines nil)
   '(haskell-stylish-on-save t)
    '(haskell-tags-on-save t)))

(use-package intero
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(global-flycheck-mode)
(package-initialize)
