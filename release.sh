#!/bin/bash

export APPLE_ID=""
export APPLE_ID_PASSWORD=""

yarn cache clean
rm -rf ./node_modules ./dist ./build ./yarn.lock

yarn config set openssl_fips ''

yarn install

yarn config set 'openssl_fips' ''

yarn dist

if [[ -z $APPLE_ID ]]
then
  codesign -s - --deep --force ./dist/mac-universal/Razer\ macOS.app
fi

unset APPLE_ID
unset APPLE_ID_PASSWORD
