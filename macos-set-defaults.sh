#!/bin/sh

# See: https://macos-defaults.com/dock/orientation.html

# Dock

## Autohide dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock

## Decrease icon size (default: 48)
defaults write com.apple.dock "tilesize" -int "47" && killall Dock

## Don't display recent apps
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock

# Screenshots

## Save screenshots to ~/Pictures/Screenshots
mkdir -p "~/Pictures/Screenshots"
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots" && killall SystemUIServer

# Finder

## Show file extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# Mission Control

## Don't reorder spaces
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
