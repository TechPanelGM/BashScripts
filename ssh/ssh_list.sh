#!/bin/bash

# List of VPS IP addresses
VPS_LIST=("192.168.1.1" "192.168.1.2" "192.168.1.3")

# ASCII art for the menu
echo "============================="
echo "       VPS Selection"
echo "============================="

# Display the VPS list with numbers
for i in "${!VPS_LIST[@]}"; do
  echo "$((i+1)). ${VPS_LIST[$i]}"
done

# Prompt user for selection
read -p "Choose a VPS (1-${#VPS_LIST[@]}): " choice

# Check if the choice is valid
if [[ "$choice" -ge 1 && "$choice" -le "${#VPS_LIST[@]}" ]]; then
  selected_vps=${VPS_LIST[$((choice-1))]}
  echo "You chose VPS with IP: $selected_vps"
  read -p "Enter the remote username: " username

  ssh $username@$choice
else
  echo "Invalid selection. Please try again."
fi
