#!/bin/sh


if [ ! $(command -v curl) ]; then
    echo "curl must be installed"
    exit 1
fi

if [ ! $(command -v git) ]; then
    echo "git must be installed"
    exit 1
fi

cd $(mktemp -d)

export PATH=$HOME/.local/bin:$PATH

curl -fsSL https://mise.run | sh

export GITHUB_TOKEN=$(mise use -g github:celsiusnarhwal/celty@0.1.0 && $(mise which celty) --client-id Iv23liTL851FJR1MJQIm)

sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b ~/.local/bin -- init --apply https://git:${GITHUB_TOKEN}@github.com/celsiusnarhwal/dotfiles