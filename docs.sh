#!/bin/sh

if [ -d "venv" ]; then
    echo "venv already exists, skipping setup"
else
    echo "venv does not exists, start setup"
    python -m venv venv
    ./venv/bin/pip install mkdocs
fi

./venv/bin/mkdocs serve