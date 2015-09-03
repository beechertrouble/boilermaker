#!/bin/sh
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
NORMAL=$(tput sgr0)

#
# delete the boilermaker repo
#
printf "\n\n"
printf "${BLUE}-------------------------\n"
printf "${BLUE}boilermaker : ${NORMAL}deleting the boilermaker repo ...\n"

rm -rf .git
rm -rf .gitignore
mv _boilermaker-plates/.gitignore .gitignore
if [ -d .git ]; then 
	printf "${RED}error deleting git repo.\n"
	printf "${NORMAL}try running with sudo?\n"
else
	printf "${GREEN}successfully deleted boilermaker repo!\n"
fi

printf "${BLUE}-------------------------${NORMAL}"
printf "\n\n"


#
# create new git repo
#
printf "\n\n"
printf "${BLUE}-------------------------\n"
printf "${BLUE}boilermaker : ${NORMAL}creating new git repo ...\n"

repo_name=$1
dir_name=`basename $(pwd)`
account_name=$2
user_name=$3

if [ "$repo_name" = "" ]; then
	printf "\nWhat should we call this git repo?\n"
	printf "Maybe something like : client-project-purpose ?\n"
	printf "Please enter the git REPO_NAME and press enter. ( press enter to use '$dir_name' ) \n"
	read repo_name
	printf "\nWhat github account should we put this repo under?\n"
	printf "Please enter your git ACCOUNT_NAME and press enter. \n"
	read account_name 
	printf "\nPlease enter your git USER_NAME and press enter. ( press enter to use '$account_name') \n"
	read user_name 
fi

if [ "$repo_name" = "" ]; then
	repo_name=$dir_name
fi

if [ "$user_name" = "" ]; then
	user_name=$account_name
fi

printf "\nrepo name = $repo_name\n"
printf "account name = $account_name\n"
printf "user name = $account_name\n\n"

#curl -u "$user_name" https://api.github.com/"$account_name"/repos -d "{\"name\":\"$repo_name\"}"
# curl -u "$username:$token" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
# /orgs/:org/repos

if ["$account_name" = "$user_name"]; then 
	curl -u "$user_name" https://api.github.com/user/repos -d '{"name":"'$repo_name'", "private":"true"}'
else 
	curl -u "$user_name" https://api.github.com/orgs/"$account_name"/repos -d '{"name":"'$repo_name'", "private":"true"}'
fi


git init
git add .
git commit -am 'boilermaker slammed! ( initial commit )'
git remote add origin "https://github.com/$account_name/$repo_name.git"
git push origin master

printf "${BLUE}-------------------------${NORMAL}"
printf "\n\n"


#
# create boilerplate wiki pages
#
printf "\n\n"
printf "${BLUE}-------------------------\n"
printf "${BLUE}boilermaker : ${NORMAL}creating boilerplate wiki pages ...\n"
printf "${BLUE}-------------------------${NORMAL}"
printf "\n\n"


#
# remove the boilermaker bash and _boilermaker-pates
#
printf "\n\n"
printf "${BLUE}-------------------------\n"
printf "${BLUE}boilermaker : ${NORMAL}remove the boilermaker plates ...\n"

#rm -rf _boilermaker-plates
#rm -rf boilermaker.sh 

printf "\n${GREEN}\n"
printf ">-------------------------\n"
printf ">-------------------------\n\n"
printf "DONE!\n\n"
printf ">-------------------------\n"
printf ">-------------------------"
printf "${NORMAL}\n\n\n\n"