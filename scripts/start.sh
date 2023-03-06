#!/bin/bash

# set options
install=false
reset=false

while getopts ":ir" arg; do
  case $arg in
  i) install=true ;;
  r) reset=true ;;
  *) ;;
  esac
done

if $reset && ! $install; then
  reset=false
fi

# check if git is installed
if ! command -v git &>/dev/null; then
  echo "Git is required, but is not installed. Aborting."
  exit 1
fi

# check if git lfs is installed
if ! git lfs --version &>/dev/null; then
  echo "Git LFS is required, but is not installed. Aborting."
  exit 1
fi

# check if lando is installed
if ! command -v lando &>/dev/null; then
  echo "Lando is required, but is not installed. Aborting."
  exit 1
fi

# reset the project
if $reset; then
  rm -rf node_modules
  rm -rf vendor
  lando destroy -y
fi

# setup git lfs
if $install; then
  git lfs install
fi

git lfs checkout

# copy environment files
if $install; then
  cp .env.example .env
fi

# start lando
lando start

# install composer dependencies
lando composer install

# install npm dependencies
lando npm install

# app specific installation steps
if $install; then
  lando artisan key:generate
  lando artisan migrate:fresh --seed
  lando artisan storage:link
  lando composer ide
fi

# open lando urls
if command -v open &>/dev/null; then
  open "http://statamic-playground.lndo.site"
fi

# start node server
lando npm run dev
