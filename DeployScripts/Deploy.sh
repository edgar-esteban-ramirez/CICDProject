#!/usr/bin/bash

echo $PASS >> /tmp/.auth

scp /tmp/.auth root@DeployServer:/tmp/.auth