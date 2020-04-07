#!/usr/bin/env bash

set -ex

# Checks if script is running as non root
if [ $UID -eq 0 ]; then
  echo "You must run this script as a non-root user..."
  exit 1
fi

readonly USERNAME=$(cat /etc/passwd | grep '1000:1000' | awk -F ':' '{print $1}')
readonly GOPATH="${HOME}/go"

# Install brew
yes "" | curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

#################################################
## Programming languages and dependency managers
#################################################

# Use system's user permissions
echo 'gem: --user-install' >> ~/.gemrc

# Install kube-ps1, kubectx. kubetail, kubenvs (check installing with brew)
/home/linuxbrew/.linuxbrew/bin/brew update \
&& /home/linuxbrew/.linuxbrew/bin/brew install stern kubectx kube-ps1 terraform-docs 

# Create GOPATH dir
mkdir -p ${GOPATH}/{src,pkg,bin}

# Install dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh 

# Install vegeta
go get -u github.com/tsenart/vegeta 

# Install aws-iam-authenticator
go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator 

# Install awless
go get -u github.com/wallix/awless

# Install terraforming, landscape and github_changelog_generator
gem install \
  terraforming \
  terraform_landscape \
  github_changelog_generator

# Install awscli, ansible, virtualenvwarpper
pip install \
  awscli \
  ansible \
  virtualenvwrapper \
&& source ${HOME}/.local/bin/virtualenvwrapper.sh

# Copy application settings and source the source .bashrc
cp ${HOME}/dotfiles/.gitconfig ${HOME}
cp ${HOME}/dotfiles/.tmux.conf ${HOME}

source /home/${USERNAME}/.bashrc
