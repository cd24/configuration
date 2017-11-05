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

(provide 'setup-haskell)
