#!/usr/bin/env bash

# Exit immediately if a pipeline returns a non-zero status:
set -e

# Install Poetry to the $POETRY_HOME directory:
export POETRY_HOME="/poetry"

if [ ! -d "$POETRY_HOME" ]; then
    # Ensures that $POETRY_HOME exists or create it:
    mkdir $POETRY_HOME
fi

curl --request GET \
    --url https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
    --silent \
    --show-error \
    --output $POETRY_HOME/get-poetry.py

python $POETRY_HOME/get-poetry.py \
    --force \
    --no-modify-path \
    --yes >> /dev/null

rm --force $POETRY_HOME/get-poetry.py
ln --symbolic --force $POETRY_HOME/bin/poetry /usr/local/bin/poetry

# Good-bye, cruel world!
unset POETRY_HOME
rm -- "$0"
