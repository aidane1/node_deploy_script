#!/bin/bash

# Pushes all code to github
git add *
git commit -m "added"
git push

# Runs the initiate.sh file to start the upload process
/Users/aidaneglin/stemulationTutorials/node_deploy_script/deploy/initiate.sh