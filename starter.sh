#!/bin/bash

INIT_DIRECTORY=$PWD
PROJECT_NAME=$1
PROJECT_DIRECTORY="${PWD}/${PROJECT_NAME}"
INSTALLATION_DIRECTORY=/home/$USER/.starters
INSTALLATION_NAME='vite-react'

yarn create vite $PROJECT_NAME --template react-ts &&

cd $PROJECT_NAME &&
yarn add --dev @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-airbnb eslint-config-prettier eslint-import-resolver-typescript eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-hooks pre-commit prettier &&
yarn add @chakra-ui/react @emotion/react@^11 @emotion/styled@^11 framer-motion@^5 react-router-dom react-icons axios history zustand &&
cp -r $INSTALLATION_DIRECTORY/$INSTALLATION_NAME/config-files/. $PROJECT_DIRECTORY/. && 
touch $PROJECT_DIRECTORY/.env.local

echo "vite-react project created, run: cd ${PROJECT_NAME}"
