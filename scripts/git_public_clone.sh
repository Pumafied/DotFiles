#!/bin/bash
# Credit KAI TAYLOR - https://kai-taylor.com/download-github-repos-for-user/
# Clone all github.com repositories for a specified user.


if [ $# -eq 0 ]
  then
    echo "Usage: $0 <user_name> "
    exit;
fi

USER=$1
# clone all repositories for user specifed
for repo in `curl -s https://api.github.com/users/$USER/repos?per_page=1000 |grep git_url |awk '{print $2}'| sed 's/"\(.*\)",/\1/'`;do
  git clone $repo;
done;
