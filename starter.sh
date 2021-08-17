#!bin/zsh

INIT_DIRECTORY=$PWD
PROJECT_DIRECTORY=$PWD/$1
PROJECT_NAME=$1
INSTALLATION_DIRECTORY=/home/$USER/.starters
INSTALLATION_NAME='vite-react'

yarn create vite $PROJECT_NAME --template react-ts &&
cd $PROJECT_NAME &&
yarn add --dev @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-prettier eslint-plugin-prettier eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-simple-import-sort pre-commit prettier &&
yarn add @chakra-ui/react @emotion/react@^11 @emotion/styled@^11 framer-motion@^4 react-router-dom@next react-icons axios history zustand &&
yarn remove typescript && yarn add --dev typescript@4.1.2
cd $INSTALLATION_DIRECTORY/$INSTALLATION_NAME &&
cp -r ./config-files $PROJECT_DIRECTORY/ && 
touch $PROJECT_DIRECTORY/.env.local
