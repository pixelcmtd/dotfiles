#!/bin/sh
set -uxe

mkdir -p ~/Library/KeyBindings
gen-compose Compose.yaml > ~/Library/KeyBindings/DefaultKeyBinding.dict
