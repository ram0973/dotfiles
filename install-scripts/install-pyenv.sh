#!/usr/bin/env bash
# Install pyenv

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

PYTHON_VERSION=3.11.2

sudo apt-get update
echo 👍 Install pyenv dependencies
sudo apt-get install -y git make wget curl gettext
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl

echo 👍 Install pyenv
[ -d "$HOME/.pyenv/" ] && echo Pyenv installed, skipping install
[ ! -d "$HOME/.pyenv/" ] && curl https://pyenv.run | bash

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install $PYTHON_VERSION
pyenv local $PYTHON_VERSION
