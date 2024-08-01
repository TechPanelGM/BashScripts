#!/bin/bash

# Main menu function
main_menu() {
  echo "============================="
  echo "          Main Menu          "
  echo "============================="
  echo "1: SSH"
  echo "2: Exit"
  echo "============================="
  read -p "Choose an option (1-4): " main_choice

  case $main_choice in
    1) ssh_menu ;;
    2) exit ;;
    *) echo "Invalid option, please try again." ;;
  esac
}

# SSH menu function
ssh_menu() {
  echo "============================="
  echo "           SSH Menu          "
  echo "============================="
  echo "1.1: Connect to a server using IP address"
  echo "1.2: Connect to a server from the URL list"
  echo "1.3: Back to Main Menu"
  echo "============================="
  read -p "Choose an option (1.1-1.3): " ssh_choice

  case $ssh_choice in
    1.1)
      read -p "Enter username for remote server: " username
      read -p "Enter IP address: " ip
      echo "Connecting as $username to server at $ip..."
      ssh $username@$ip
      ;;
    1.2)
      chmod +x ssh/ssh_list.sh
      . ssh/ssh_list.sh
      ;;
    1.3) main_menu ;;
    *) echo "Invalid option, please try again." ;;
  esac
}

# Start the script by displaying the main menu
main_menu
