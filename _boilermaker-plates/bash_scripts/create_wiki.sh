#!/bin/sh

#account_name='beechertrouble'
#repo_name='testing'
#
##curl -c cookies.txt https://github.com/$account_name/$repo_name/wiki/_new 
##curl -b cookies.txt --data "wiki[body]=Welcome to the $repo_name wiki!&wiki[commit]=Initial Home page&wiki[format]=markdown&wiki[name]=Home" https://github.com/$account_name/$repo_name/wiki 
##&authenticity_token=RZ36jTJlDEOThKX1tm%2Bj3LTMuVh50HWvD21b4zo8J5SX4HbZSP7UWu58rUwNm7Wvb6LszbubW8iiraW%2BiR3U6Q%3D%3D
#curl -c cookies.txt --data "utf8=%E2%9C%93&wiki%5Bname%5D=Home&wiki%5Bformat%5D=markdown&wiki%5Bbody%5D=Welcome+to+the+testing+wiki%21%0D%0A&wiki%5Bcommit%5D=Initial+Home+page" https://github.com/$account_name/$repo_name/wiki 
#
##curl -u $username:$token https://github.com/beechertrouble/testing/wiki -d "{\"wiki[body]\":\"Welcome to the $repo_name wiki!\", \"wiki[commit]\":\"Initial Home page\", \"wiki[format]\":\"markdown\", \"wiki[name]\":\"Home\"}"
#
git_wiki="https://github.com/$account_name/$repo_name.wiki.git"
#git_wiki="https://github.com/beechertrouble/testing.wiki.git"
##git clone https://github.com/beechertrouble/testing.wiki.git
git ls-remote "$git_wiki" &>-
if [ "$?" -ne 0 ]; then
	printf "\n"
	printf "${RED}-------------------------\n"
	printf "ERROR : Unable to read from '$git_wiki'\n"
	printf "${RED}-------------------------\n\n${NORMAL}"
	exit 1;
else 
	printf "\n${GREEN}boilermaker : $git_wiki wiki exists!\n${NORMAL}"
fi
