#!/bin/bash
# Credit KAI TAYLOR - https://kai-taylor.com/download-github-repos-for-user/
# clone all repositories for user specifed
# Set your environment variable git_token to your github one 
# make sure that the code dir exists

echo $git_token
for repo in `curl -H "Authorization: token $git_token" -s https://api.github.com/user/repos |grep ssh_url |awk '{print $2}'| sed 's/"\(.*\)",/\1/'`;do
  echo $repo
  git clone $repo ~/code/;
done;
