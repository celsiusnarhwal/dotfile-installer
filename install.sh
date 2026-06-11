#!/bin/sh

if [ ! $(command -v curl) ]; then
    echo "curl must be installed"
    exit 1
fi

if [ ! $(command -v git) ]; then
    echo "git must be installed"
    exit 1
fi

tmpdir=$(mktemp -d)

cd "$tmpdir"

curl -fsSL https://astral.sh/uv/install.sh | env UV_UNMANAGED_INSTALL="$tmpdir" sh

export GITHUB_TOKEN=$(./uvx celty get --client-id Iv23liTL851FJR1MJQIm)

sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b ~/.local/bin -- init --apply https://git:${GITHUB_TOKEN}@github.com/celsiusnarhwal/dotfiles

rm -rf "$tmpdir"
