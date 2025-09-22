#!/bin/bash
source ./.env
echo "root:$ROOT_PASSWORD" | chpasswd
useradd -m $USER
usermod -aG wheel $USER
echo "$USER:$PASSWORD" | chpasswd

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

pacman -Syuu --noconfirm
pacman -Sy --noconfirm git helix tmux zsh lazygit

sudo -u $USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'alias hx="helix"' >> /home/$USER/.zshrc
git clone https://github.com/janoferenczi/dotfiles /home/$USER/.config/

cp ./.zshrc /home/$USER/.zshrc
