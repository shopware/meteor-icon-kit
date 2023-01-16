#! /usr/bin/env bash
set -e

[[ -z "$1" ]] && echo "Missing working directory argument" && exit 1

echo "Installing pnpm"
pnpm --dir $1 i

echo "Running root build"
pnpm run --dir $1 build

echo "Building figma"
pnpm run --dir $1 start

echo "Copying icons"
cp -R "$1/icons" "$1/docs/public"
