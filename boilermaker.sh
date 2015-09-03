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

# rm -rf .git
# rm -rf .gitignore
# mv _boilermaker-plates/.gitignore .gitignore
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
account_name_default=`git config github.account`
account_name=`git config github.account`
org_name=$3
private_repo='y'
username=`git config github.user`
token=`git config github.token`

source ../boilermaker/_boilermaker-plates/bash_scripts/create_repo.sh

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
printf "boilermaker : DONE!\n\n"
printf ">-------------------------\n"
printf ">-------------------------"
printf "${NORMAL}\n\n\n\n"