#! /usr/bin/env bash
set -e

echo "Installing pnpm"
pnpm i --dir /tmp/mount-all
#npm i --prefix /tmp/mount-all

echo "Running root build"
pnpm run --dir /tmp/mount-all build
#npm run --prefix /tmp/mount-all build

echo "Building figma"
pnpm run --dir /tmp/mount-all start
#npm run --prefix /tmp/mount-all start

echo "Running docs build"
pnpm run --dir /tmp/mount-all/docs build
#npm run --prefix /tmp/mount-all/docs build