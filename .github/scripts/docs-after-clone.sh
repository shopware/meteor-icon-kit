#! /usr/bin/env bash
set -e

echo "Installing pnpm"
pnpm i --dir /tmp/mount-all

echo "Running root build"
pnpm run --dir /tmp/mount-all build

echo "Building figma"
pnpm run --dir /tmp/mount-all start

echo "Copying icons"
cp -R /tmp/mount-all/icons /tmp/mount-all/docs/public
