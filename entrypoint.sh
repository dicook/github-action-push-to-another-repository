#!/bin/sh -l

echo "Starts"
FOLDER="$1"
GITHUB_USERNAME="$2"
GITHUB_REPO="$3"
USER_EMAIL="$4"
DST_BRANCH="$5"

git -rf .git
cd $FOLDER

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
rm -rf .git
git init
git add . 
git commit -m "build website"
git remote add origin "https://$GITHUB_USERNAME:$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git"
git push -u --force origin "HEAD:$DST_BRANCH"
