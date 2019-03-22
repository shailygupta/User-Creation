#! /bin/bash

#This script must be run with elevated privileges for success

username=$1
GREEN='\033[0;32m'
NC='\033[0m' # No Color
YELLOW='\033[1;33m'

echo -e "${YELLOW}Creating new user for "$username"...${NC}"
adduser $username
echo  -e "${GREEN}User " $username" has been created!${NC}"

echo '___________________________________________'
echo -e "${YELLOW}Adding user to the sudo group...${NC}"
usermod -aG sudo $username
echo -e $GREEN $username" has been added to the sudo group ${NC}"
echo '___________________________________________'
echo -e "${YELLOW}Testing Access ...${NC}"
su - $username
echo '___________________________________________'
# echo('Testing sudo ...')
# sudo ls -la /root

echo -e "${GREEN} Process completed ${NC}"
