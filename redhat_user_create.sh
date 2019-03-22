#! /bin/bash

#This script must be run with elevated privileges for success

username=$1
GREEN='\033[0;32m'
NC='\033[0m' # No Color
YELLOW='\033[1;33m'

echo -e "${YELLOW}Creating new user for "$username"...${NC}"
adduser -m $username -d /home/$username -s /bin/bash
echo  -e "${GREEN}User " $username" has been created!${NC}"
passwd $username
echo -e ${YELLOW} $username" has now been created and has been reset with a new password ${NC}"
echo "___________________________________________"
echo -e "${YELLOW}Adding user to the sudo group...${NC}"
# usermod -aG wheel $username
chmod +w /etc/sudoers && echo $username" ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers && chmod -w /etc/sudoers
echo -e $GREEN $username" has been added to the sudo group ${NC}"


echo '___________________________________________'
echo -e "${YELLOW}Testing Access ...${NC}"
su - $username
echo '___________________________________________'
# echo 'Testing sudo ...'
# sudo ls -la /root

echo -e "${GREEN} Process completed ${NC}"
