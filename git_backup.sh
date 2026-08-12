#!/bin/bash

cd /home/it26120066/AgExp2

git add .

if git diff --cached --quiet
then
    echo "No changes to commit."
else
    git commit -m "Automatic backup: $(date)"
    git push origin main
    echo "Changes pushed successfully."
fi
