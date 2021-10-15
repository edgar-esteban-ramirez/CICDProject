#!/usr/bin/bash
set -x
echo $PASS >> /tmp/.auth

scp /tmp/.auth root@DeployServer:/tmp/.auth