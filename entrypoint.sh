#!/bin/sh -l

time=$(date)
ansiblepath=$(which ansible)
antsibullpath=$(which antsibull-docs)
echo "Hello $1"
echo "$ansiblepath"
echo "$antsibullpath"
echo "$GITHUB_WORKSPACE"
ls -lrt $GITHUB_WORKSPACE
echo "::set-output name=time::$time"

echo "::set-output name=time::$ansiblepath"

namespace=$(awk '/^namespace/ {print $2}' $GITHUB_WORKSPACE/galaxy.yml)
collection=$(awk '/^name:/ {print $2}' $GITHUB_WORKSPACE/galaxy.yml)
ansible-galaxy collection install git+file://$GITHUB_WORKSPACE/.git
antsibull-docs collection --use-current --squash-hierarchy --dest-dir ./docsrc/source $namespace.$collection
sphinx-build ./docsrc/source ./docs