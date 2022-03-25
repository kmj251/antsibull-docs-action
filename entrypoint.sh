#!/bin/sh -l

time=$(date)
ansiblepath=$(which ansible)
echo "Hello $1"
echo "$ansiblepath"
echo "::set-output name=time::$time"

echo "::set-output name=time::$ansiblepath"