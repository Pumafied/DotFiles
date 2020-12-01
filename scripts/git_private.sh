#!/bin/bash
# Credit KAI TAYLOR - https://kai-taylor.com/download-github-repos-for-user/
# clone all repositories for user specifed
# Set your environment variable git_token to your github one
# make sure that the code dir exists

# If there is no git token set then show a warning
#echo $git_token
# Warning this has to be run from the dir that you want the code in
for repo in `curl -H "Authorization: token $git_token" -s https://api.github.com/user/repos |grep ssh_url |awk '{print $2}'| sed 's/"\(.*\)",/\1/'`;do
  echo $repo
  git clone $repo;
done;
