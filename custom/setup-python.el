(use-package elpy
  :config
  (setq elpy-rpc-timeout 10)
  (setq elpy-django-server-ipaddr "127.0.0.1")
  (setq elpy-django-server-port 5555)
  :init
  (elpy-enable))
(use-package py-autopep8
  :bind
  (("C-c C-a" . py-autopep8))
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (setq py-autopep8-options '("--max-line-length=200")))

(provide 'setup-python)
