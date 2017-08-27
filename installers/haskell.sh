#!/bin/bash

# Installs stack, ghc-mod

curl -sSL https://get.haskellstack.org/ | sh

stack install ghc-mod
