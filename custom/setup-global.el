(use-package flycheck)
(use-package company)
(use-package nlinum
  :config
  (global-nlinum-mode))

(use-package helm
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  :init
  (helm-mode 1))

(provide 'setup-global)
