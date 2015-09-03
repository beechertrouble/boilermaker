#!/bin/sh

if [ "$username" = "" ]; then 
	username=`git config git.user`
fi

if [ "$username" = "" ]; then
	printf "\n"
	printf "${RED}-------------------------\n"
	printf "ERROR : Could not find github username.\n"
	printf "${NORMAL} - Run 'git config --global github.user <your username here>'\n"
	printf "${RED}-------------------------\n\n${NORMAL}"
	exit 1;
fi

if [ "$token" = "" ]; then
	printf "\n"
	printf "${RED}-------------------------\n"
	printf "ERROR : Could not find github token.\n"
	printf "${NORMAL} - You may have to create a token here if you did not already : https://github.com/settings/tokens.\n"
	printf " - You'll need to tick the 'repo' checkbox to grant permission for private repo creation.\n"
	printf " - Then you add it to your global config like : 'git config --global github.token <your github token here>'\n"
	printf "${RED}-------------------------\n\n${NORMAL}"
	exit 1;
fi

if [ "$account_name" = "" ]; then
	account_name=$username
fi

if [ "$repo_name" = "" ]; then
	
	printf "\n${BLUE}boilermaker : ${NORMAL}What should we call this git repo?\n"
	printf " - Maybe something like : client-project-purpose ?\n"
	printf " - Please enter the git REPO_NAME and press enter. ( press enter to use '$dir_name' ) \n"
	read repo_name
	
	if [ "$account_name_default" = "" ]; then 
		printf "\n${BLUE}boilermaker : ${NORMAL}What github account should we use?\n"
		printf " - Only really necessarry if your account name is different than your username.\n"
		printf " - You can also add this to your global config like : 'git config --global github.account <your github account name here>'\n"
		printf " - Please enter the git ACCOUNT_NAME and press enter. ( press enter to use '$account_name' )\n"
		read account_name 
	fi
	
	if [ "$account_name" = "" ]; then
		account_name=$account_name_default
	fi
	if [ "$account_name" = "" ]; then
		account_name=$username
	fi
	
	printf "\n${BLUE}boilermaker : ${NORMAL}What github organization should we put this repo under?\n"
	printf " - Please enter the git ORGANIZATION and press enter. ( press enter to use your personal account '$account_name')\n"
	read org_name 
	
	printf "\n${BLUE}boilermaker : ${NORMAL}Do you want a private repo?\n"
	printf " - Please enter 'y/n' and press enter. ('y' for private, 'n' for public)\n"
	read private_repo 
	
	printf "\n"
	
fi

if [ "$private_repo" = "y" ]; then
	private_repo=", \"private\":\"true\""
else 
	private_repo=""
fi

if [ "$repo_name" = "" ]; then
	repo_name=$dir_name
fi

if [ "$org_name" = "" ]; then 
	
	printf "\n${BLUE}boilermaker : ${NORMAL}creating repo at '$account_name/$repo_name' ...\n"
	
	curl -u $username:$token https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"$private_repo}"
	
else 
	
	account_name=$org_name
	
	printf "\n${BLUE}boilermaker : ${NORMAL}creating repo at '$account_name/$repo_name' ...\n"
	
	curl -u $username:$token https://api.github.com/orgs/$org_name/repos -d "{\"name\":\"$repo_name\"$private_repo}"
	
fi

git ls-remote "https://github.com/$account_name/$repo_name.git" &>-
if [ "$?" -ne 0 ]; then
	printf "\n"
	printf "${RED}-------------------------\n"
	printf "ERROR : Unable to read from 'https://github.com/$account_name/$repo_name.git'\n"
	printf "${NORMAL} - check above for git errors.\n"
	printf "${RED}-------------------------\n\n${NORMAL}"
	exit 1;
else 
	printf "\n${GREEN}boilermaker : https://github.com/$account_name/$repo_name.git created successfully!\n${NORMAL}"
fi


# git init
# git add .
# git commit -am 'boilermaker slammed! ( initial commit )'
# git remote add origin "https://github.com/$account_name/$repo_name.git"
# git push origin master
