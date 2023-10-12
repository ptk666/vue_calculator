#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m "updated"
git push -f git@github.com:ptk666/vue_calculator.git master:gh-pages

cd -