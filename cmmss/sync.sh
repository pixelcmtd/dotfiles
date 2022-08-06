#!/bin/sh
set -uxe

# generate package lists for homebrew and mas
brew list > packages.brew
cargo install --list | grep -v '^ ' | cut -d' ' -f1 | sort > packages.cargo
mas list | sort > packages.mas

set +x
echo "Have fun with hours of git diff and editing the package lists!"
