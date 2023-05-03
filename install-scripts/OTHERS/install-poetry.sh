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

echo 👍 Install poetry
POETRY_URL=https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py
[ -d "$HOME/.poetry/" ] && echo Poetry installed, skipping install
[ ! -d "$HOME/.poetry/" ] && curl -L "$POETRY_URL" | python

poetry completions bash > /etc/bash_completion.d/poetry.bash-completion
echo 😎 Please Relogin
