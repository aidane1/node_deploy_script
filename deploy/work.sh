#!/bin/bash
set -e

### Configuration ###

APP_DIR=/home/stemulationTutorials/node_deploy_script
GIT_URL=https://github.com/aidane1/blog-interface.git



### Automation steps ###


set -x
# Pull latest code
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
pm2 restart interface