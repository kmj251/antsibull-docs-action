#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
ansiblepath=$(which ansible)
echo "::set-output name=time::$ansiblepath"