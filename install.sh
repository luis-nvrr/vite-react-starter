#!bin/zsh

CURRENT_DIRECTORY=$PWD
INSTALLATION_DIRECTORY=/home/$USER/.starters
INSTALLATION_NAME='vite-react'


if cd $INSTALLATION_DIRECTORY; then
	echo '~/.starters/ exists'
	if cd $INSTALLATION_DIRECTORY/$INSTALLATION_NAME; then
		rm -rf $INSTALLATION_DIRECTORY/$INSTALLATION_NAME &&
		echo '~/.starters/vite-react exists' &&
		echo 'deleting old files ...'
	fi
	echo 'creating ~/.starters/vite-react ...' &&
	mkdir $INSTALLATION_DIRECTORY/$INSTALLATION_NAME 
else
	echo 'creating ~/.starters/ ...' &&
	mkdir $INSTALLATION_DIRECTORY &&
	echo 'creating ~/.starters/vite-react ...' &&
	mkdir $INSTALLATION_DIRECTORY/$INSTALLATION_NAME 
fi

if [ $? -eq 0 ]; then
	echo 'folders created'
else
	echo 'error creating folders'
fi


if echo 'copying new files ...' &&
cp -r $CURRENT_DIRECTORY/config-files $INSTALLATION_DIRECTORY/$INSTALLATION_NAME/ && 
cp $CURRENT_DIRECTORY/starter.sh $INSTALLATION_DIRECTORY/$INSTALLATION_NAME &&
cp $CURRENT_DIRECTORY/install.sh $INSTALLATION_DIRECTORY/$INSTALLATION_NAME; then
	
	echo 'files copied'
else
	echo 'error copying files'
	exit 2
fi


echo 'creating alias...' &&
	if grep vite-react ~/.zshrc > /dev/null; then
	echo 'alias exists'
	else
	echo "alias vite-react='sh ${INSTALLATION_DIRECTORY}/${INSTALLATION_NAME}/starter.sh'" >> ~/.zshrc
	fi

if [ $? -eq 0 ]; then
	echo 'succeed ⚡' &&
	echo 'use -> vite-react [name]'
else
	echo 'error'
fi
