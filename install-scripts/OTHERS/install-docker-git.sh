#!/usr/bin/env bash
# Install Docker for Ubuntu/Debian. Tested in Ubuntu only

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
# set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

echo 👍 Installing docker, docker-compose, docker-machine
echo 👍 Get last releases versions
sudo apt-get update
sudo apt-get install curl -y
OS=$(uname -s)
ARCH=$(uname -m)
RELEASE=$(lsb_release -cs)
DISTRIBUTOR=$(lsb_release -i | sed -e "s/Distributor ID:\t*//" |  awk '{print tolower($0)}')
GPG=$(curl -L "https://download.docker.com/linux/$DISTRIBUTOR/gpg")
COMPOSE_VER=$(curl -L https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name'  | cut -d\" -f4)
COMPOSE_URL="https://github.com/docker/compose/releases/download/$COMPOSE_VER/docker-compose-$OS-$ARCH"
COMPOSE_COMP="https://raw.githubusercontent.com/docker/compose/$COMPOSE_VER/contrib/completion/bash/docker-compose"
MACHINE_VER=$(curl -L https://api.github.com/repos/docker/machine/releases/latest | grep 'tag_name' | cut -d\" -f4)
MACHINE_URL="https://github.com/docker/machine/releases/download/$MACHINE_VER/docker-machine-$OS-$ARCH"
MACHINE_COMP=https://raw.githubusercontent.com/docker/machine/$MACHINE_VER/contrib/completion/bash

echo 👍 Installing docker
sudo apt-get install -y apt-transport-https ca-certificates wget gnupg-agent software-properties-common lsb-release
echo "$GPG" | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$DISTRIBUTOR $RELEASE stable"
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo 👍 Installing docker-compose
sudo curl -L "$COMPOSE_URL" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L "$COMPOSE_COMP" -o /etc/bash_completion.d/docker-compose

echo 👍 Installing docker-machine
sudo curl -L "$MACHINE_URL" -o /usr/local/bin/docker-machine
sudo chmod +x /usr/local/bin/docker-machine
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash; do
    sudo wget "$MACHINE_COMP"/$i -P /etc/bash_completion.d;
done

echo 👍 Starting docker service and adding user to Docker group
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker "$USER"

echo 😎 Relogin to run Docker without sudo and enable auto completion
