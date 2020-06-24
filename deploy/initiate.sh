#!/bin/bash
set -e

### Configuration ###

# your remote server address
SERVER=root@255.255.2555.255 

# the path to your local work.sh file. Can be found by opening the 
# terminal to your project and running 'pwd'
LOCAL_FILE_PATH=/Users/aidaneglin/stemulationTutorials/node_deploy_script

# The path to your project on the remote server
REMOTE_SCRIPT_PATH=/home/aidan/stemulationTutorials

# Assures that all tests are passing before it tries to deploy
if npm test ; then

	# Gives a visual indiction in the terminal that the script is running successfully
	echo "---- Running deployment script on remote server ----"

	# 'scp' or 'Secure Copy Files' is a method of transfering files to a remote server
	# from the terminal.
	# syntax:
	# scp /path/to/local/file user@remote_address:/path/to/remote/file
	scp $LOCAL_FILE_PATH/deploy/work.sh $SERVER:$REMOTE_SCRIPT_PATH/work.sh

	# This command will log in to your remote server & run the work.sh file
	ssh $SERVER bash $REMOTE_SCRIPT_PATH/work.sh

	# After work.sh is finished running, this command will log in and remove the file
	ssh $SERVER "rm -f $REMOTE_SCRIPT_PATH/work.sh"

else 
	echo "An error occured during testing. Deployment failed"
fi





