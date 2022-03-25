#!/bin/sh -l
# ls -lart $GITHUB_WORKSPACE
# id
# time=$(date)
# ansiblepath=$(which ansible)
# antsibullpath=$(which antsibull-docs)
#echo "Hello $1"
# echo "$ansiblepath"
# echo "$antsibullpath"
# echo "$GITHUB_WORKSPACE"
# echo "$GITHUB_SERVER_URL"
# echo "$GITHUB_REPOSITORY"
my_github_url="$GITHUB_SERVER_URL/$GITHUB_REPOSITORY"
# ls -lrt $GITHUB_WORKSPACE
# echo "::set-output name=time::$time"

# echo "::set-output name=time::$ansiblepath"
#mkdir -p /tmp/docsrc/source
namespace=$(awk '/^namespace/ {print $2}' $GITHUB_WORKSPACE/galaxy.yml)
collection=$(awk '/^name:/ {print $2}' $GITHUB_WORKSPACE/galaxy.yml)
ls -ralt $GITHUB_WORKSPACE/.git
ansible-galaxy collection install git+file://$GITHUB_WORKSPACE/.git
#cp -R docsrc/source/* /tmp/docsrc/source/.
#antsibull-docs collection --use-current --squash-hierarchy --dest-dir ./docsrc/source $namespace.$collection
chown -R root:root $GITHUB_WORKSPACE
antsibull-docs collection --use-current --squash-hierarchy --dest-dir ./docsrc/source $namespace.$collection
#sphinx-build /tmp/docsrc/source ./docs
sphinx-build ./docsrc/source ./docs

git add ./docs/*
