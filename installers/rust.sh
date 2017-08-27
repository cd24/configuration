#!/bin/bash

# This script installs components for rust development in conjunction with the emacs file contained

curl https://sh.rustup.rs -sSf | sh
rustup update
rustup component add rust-src
cargo install racer

# Copy the `;;;; Rust Development` section from the default emacs file.
