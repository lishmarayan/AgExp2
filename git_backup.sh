#!/bin/bash

cd /home/it26120066/AgExp2

git add .

if git diff --cached --quiet
then
    echo "No changes to commit."
else
    git commit -m "Automatic backup: $(date)"

    if git push origin main
    then
        echo "Changes pushed successfully."
    else
        echo "Git push failed."
        exit 1
    fi
fi
