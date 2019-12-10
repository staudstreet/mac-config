#!/bin/sh
##config
mkdir ~/Projects
cd ~/Projects
git clone git@github.com:staudstreet/mac-config.git
cd mac-config
cp dotfiles/.* ~/

#iterm
cp misc/com.googlecode.iterm2.plist ~/Library/Preferences/
cp dotfiles/.* ~/

##system preferences
#dock
defaults write com.apple.dock orientation -string left			#dock orientation
defaults write com.apple.dock largesize -int 60				#dock mangnification
defaults write com.apple.Dock autohide -int 1				#auto hide on
defaults write com.apple.dock show-recents -int 0			#hide recents

#Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true 	#Enable touch clicking

#Menubar
defaults write com.apple.menuextra.battery ShowPercent YES		
defaults write com.apple.menuextra.clock DateFormat -string 'd. MMM  HH:mm:ss'	#28. Nov 11:19:52
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"

#Keyboard
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g KeyRepeat 2
defaults write -g InitialKeyRepeat 25

#System Stuff
sudo spctl --master-disable
sudo systemsetup -setremotelogin on
sudo scutil --set ComputerName rbrk-MBP
sudo scutil --set HostName rbrk-mbp.ext.rbrk.at
sudo dscacheutil -flushcache
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop\ Pictures/Earth.heic"'

#Power
sudo pmset -c displaysleep 15 disksleep 30 sleep 45			#charger
sudo pmset -b displaysleep 5 disksleep 10 sleep 15			#battery

##homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap "homebrew/cask-drivers"
brew install fish vim wget terraform nmap neofetch python smartmontools tldr blueutil tree gnu-se god
brew cask install iterm2 vscodium firefox iina steam transmission calibre spotify keka logitech-options whatsapp vagrant coconutbattery appcleaner mullvadvpn viscosity

##fish
curl -L https://get.oh-my.fish | fish
echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/fish
fish_update_completions

echo "Please manually configure the following:"
echo "* Nightshift"
echo "* Affinity Suite, Viscosity & VMWare Fusion"

exit 0

