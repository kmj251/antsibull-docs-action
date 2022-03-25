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