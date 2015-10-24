#!usr/bin/env bash

git config --global user.name 'mrizzoli'
git config --global user.email 'marco@rizzoli.me.uk'
git config --global push.default simple

# Make sure destination folder exists as git repo

# Generate the site
# Commit and push to github
mkdir -p /home/travis/build/mrizzoli/notes_src/deploy
cd /home/travis/build/mrizzoli/notes_src/deploy
git init 

git remote add origin https://github.com/mrizzoli/notes_src.git
git checkout gh-pages
git pull remote gh-pages
rsync -a /home/travis/build/mrizzoli/notes_src/_site/* /home/travis/build/mrizzoli/notes_src/deploy 

cd /home/travis/build/mrizzoli/notes_src/deploy

git add --all .
git commit -m 'Updating'
git push origin gh-pages --quiet

