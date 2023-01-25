#!/bin/bash

#my_github_url="$GITHUB_SERVER_URL/$GITHUB_REPOSITORY"

namespace=$(awk '/^namespace/ {print $2}' $GITHUB_WORKSPACE/galaxy.yml)
collection=$(awk '/^name:/ {print $2}' $GITHUB_WORKSPACE/galaxy.yml)
ls -ralt $GITHUB_WORKSPACE/.git
ansible-galaxy collection install git+file://$GITHUB_WORKSPACE/.git
mkdir -p ./docsrc/source
chown -R root:root $GITHUB_WORKSPACE
antsibull-docs collection --use-current --squash-hierarchy --dest-dir ./docsrc/source $namespace.$collection

sphinx-build ./docsrc/source ./docs

echo "Running git add"
git add -f ./docs/*
