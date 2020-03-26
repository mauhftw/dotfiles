#!/usr/bin/env bash

set -ex

# Checks if script is running as non root
if [ $UID -eq 0 ]; then
  echo "You must run this script as a non-root user..."
  exit 1
fi

readonly USERNAME=$(cat /etc/passwd | grep '1000:1000' | awk -F ':' '{print $1}')
readonly GOPATH="${HOME}/go"


#################################################
## Programming languages and dependency managers
#################################################

# Use system's user permissions
echo 'gem: --user-install' >> ~/.gemrc

# Create GOPATH dir
mkdir -p ${GOPATH}/{src,pkg,bin}

# Install dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
&& mv $GOPATH/bin/dep /usr/local/bin


# Install kube-ps1, kubectx. kubetail, kubenvs (check installing with brew)
${HOME}/.linuxbrew/bin/brew update
${HOME}/.linuxbrew/bin/brew install stern kubectx kube-ps1

# Install terraform-docs
go get github.com/segmentio/terraform-docs \
&& mv $GOPATH/bin/terraform-docs /usr/local/bin

# Install terraforming, landscape and github_changelog_generator
gem install \
  terraforming \
  terraform_landscape \
  github_changelog_generator

# Install vegeta
go get -u github.com/tsenart/vegeta \
&& mv $GOPATH/bin/vegeta /usr/local/bin

# Install aws-iam-authenticator
go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator \
&& mv $GOPATH/bin/aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# Install awscli, ansible, virtualenvwarpper
pip install \
  awscli \
  ansible \
  virtualenvwrapper \
&& source virtualenvwrapper.sh

# Copy application settings and source the source .bashrc
cp ${HOME}/dotfiles/.gitconfig ${HOME}
cp ${HOME}/dotfiles/.tmux.conf ${HOME}
source /home/${USERNAME}/.bashrc
