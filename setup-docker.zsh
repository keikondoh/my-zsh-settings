#! /bin/sh

# Docker Engine Start
if [ $(service docker status | awk '{print $4}') = "not" ]; then
  sudo service docker start > /dev/null
fi