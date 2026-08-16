#!/bin/zsh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=
export EDITOR=hx
export VISUAL=$EDITOR
export PAGER=less
export TERM=xterm-256color
export LS_COLORS=
export PREFIX="$HOME/.local"

export DO_NOT_TRACK=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_DOWNLOAD_CONCURRENCY=auto

if command -v brew >/dev/null ; then
    BREW="$(brew --prefix)"
else
    BREW="$(mktemp -d)"
fi

for x in \
    /Applications/Xcode.app/Contents/Developer/usr/bin \
    $HOME/.cabal/bin \
    $HOME/.ghcup/bin \
    $HOME/perl5/bin \
    $HOME/go/bin \
    $HOME/src/pixelcmtd/tldrgal \
    $HOME/fvm/versions/stable/bin \
    $HOME/.pub-cache/bin \
    $HOME/.emacs.d/bin \
    $HOME/.wasmer/globals/wapm_packages/.bin \
    $HOME/.wasmer/bin \
    $HOME/flutter/bin \
    $HOME/vcpkg \
    $BREW/sbin \
    $BREW/bin \
    $BREW/opt/ruby/bin \
    $BREW/opt/coreutils/libexec/gnubin \
    $BREW/opt/bison/bin \
    $BREW/opt/llvm/bin \
    $BREW/opt/rustup/bin \
    $HOME/.jsvu \
    /Applications/CrossOver.app/Contents/SharedSupport/CrossOver/bin \
    $HOME/.mint/bin \
    $HOME/.cargo/bin \
    $HOME/.rvm/bin \
    $HOME/.bin \
    $HOME/.local/bin
do
    if [ -d "$x" ] ; then
        export PATH="$x:$PATH"
    fi
done

setopt NULL_GLOB # this is a zsh-specific hack
export PATH="$PATH$(
for d in \
    $HOME/Library/Python/*/bin \
    /Applications/*.app/Contents/MacOS \
    $HOME/.gem/ruby/*/bin \
    $BREW/lib/ruby/gems/*/bin \
    /opt/*/bin \
    /opt/*/sbin
do
        echo -n ":$d"
done
)"
unsetopt NULL_GLOB
