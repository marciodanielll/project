#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

show_header() {
  echo -e "${BLUE}==============================${NC}"
  echo -e "${BLUE}     ${YELLOW}Welcome to the Menu${BLUE}     ${NC}"
  echo -e "${BLUE}==============================${NC}"
}

show_menu() {
  echo -e "${GREEN}Please select an option:${NC}"
  echo -e "${YELLOW}1${NC} - Deploy Environment"
  echo -e "${YELLOW}2${NC} - Start Environment"
  echo -e "${YELLOW}3${NC} - Restart Environment"
  echo -e "${YELLOW}4${NC} - Clean Environment"
  echo -e "${YELLOW}5${NC} - Run Seeds"
  echo -e "${YELLOW}6${NC} - Clear Seeds"
  echo -e "${YELLOW}7${NC} - View App Logs"
  echo -e "${YELLOW}8${NC} - View Database Logs"
  echo -e "${YELLOW}9${NC} - Open Shell in App Container"
  echo -e "${YELLOW}10${NC} - Exit"
}

set_volume_env_vars() {
    if ! grep -q "^SSH_VOLUME=" ../.env; then
        echo "SSH_VOLUME=$(find ~ -maxdepth 1 -type d -name ".ssh")" >> ../.env
    fi

    if ! grep -q "^GITCONFIG_VOLUME=" ../.env; then
        echo "GITCONFIG_VOLUME=$(find ~ -maxdepth 1 -type f -name ".gitconfig")" >> ../.env
    fi
}

while true; do
  clear
  set_volume_env_vars
  show_header
  show_menu

  echo
  read -p "$(echo -e ${GREEN}Enter your choice:${NC} ) " choice
  echo
  case $choice in
    1)
      echo -e "${GREEN}Deploying environment...${NC}"
      sudo docker-compose up --build -d
      echo -e "${GREEN}Environment deployed successfully.${NC}"
      ;;
    2)
      echo -e "${GREEN}Starting environment...${NC}"
      sudo docker-compose start
      echo -e "${GREEN}Environment started successfully.${NC}"
      ;;
    3)
      echo -e "${GREEN}Restarting environment...${NC}"
      sudo docker-compose restart
      echo -e "${GREEN}Environment restarted successfully.${NC}"
      ;;
    4)
      echo -e "${GREEN}Cleaning environment...${NC}"
      sudo docker-compose down -v
      echo -e "${GREEN}Environment cleaned successfully.${NC}"
      ;;
    5)
      echo -e "${GREEN}Running seeds...${NC}"
      echo -e "${GREEN}Seeds executed successfully.${NC}"
      ;;
    6)
      echo -e "${GREEN}Clearing seeds...${NC}"
      echo -e "${GREEN}Seeds cleared successfully.${NC}"
      ;;
    7)
      echo -e "${GREEN}Viewing app logs...${NC}"
      sudo docker-compose logs -f nest-app
      ;;
    8)
      echo -e "${GREEN}Viewing database logs...${NC}"
      sudo docker-compose logs -f mongo
      ;;
    9)
      echo -e "${GREEN}Opening shell in app container...${NC}"
      sudo docker-compose exec -it nest-app sh
      ;;
    10)
      echo -e "${RED}Exiting...${NC}"
      pkill -P $$
      exit 0
      ;;
    *)
      echo -e "${RED}Invalid choice, please try again.${NC}"
      ;;
  esac
  echo
  read -p "Press Enter to continue..."
done