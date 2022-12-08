#!/bin/sh

# See:
# - https://macos-defaults.com
# - https://git.herrbischoff.com/awesome-macos-command-line/about/

# Find settings: `defaults find <word>`
# Read setting: `defaults read <domain> <key>`
# Reset setting: `defaults delete <domain> <key>`

# Global
# -g can be used as an alias for the global domain (Apple Global Domain)

## Trackpad speed
defaults write -g com.apple.trackpad.scaling 2

# Dock

## Autohide dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock

## Decrease icon size (default: 48)
defaults write com.apple.dock "tilesize" -int "47" && killall Dock

## Don't display recent apps
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock

# Screenshots

## Save screenshots to ~/Pictures/Screenshots
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture "location" -string "$HOME/Pictures/Screenshots" && killall SystemUIServer

# Finder

## Show file extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# Mission Control

## Don't reorder spaces
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
