#!/bin/bash
set -e

### Configuration ###

# The path to your project on the remote server
APP_DIR=/home/aidan/stemulationTutorials/node_deploy_script

# The URL to your github repository
GIT_URL=https://github.com/aidane1/node_deploy_script.git



### Automation steps ###


set -x
# Pull latest code if the directory exists
# Or clones the repository if it doesnt

if [[ -e $APP_DIR ]]; then
  cd $APP_DIR
  echo "pulling"
  git pull
else
  git clone $GIT_URL $APP_DIR
  cd $APP_DIR
fi


# # Install dependencies
npm install --production
npm prune --production


# Restart app
echo "done!"
pm2 restart ./index.js