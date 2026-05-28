#!/bin/bash

echo "=================================="
echo "     Take Your Pick     "
echo "=================================="
echo ""
echo "Welcome, select one of the following options using the number keys:"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4: Exit"
echo ""

read -p "Enter your choice: " choice

if [ "$choice" = "1" ]; then
    echo "You selected Option 1 - Show System Info"

elif [ "$choice" = "2" ]; then
    echo "You selected Option 2 - Show Disk Usage"

elif [ "$choice" = "3" ]; then
    echo "You selected Option 3 - Show Current Users"

elif [ "$choice" = "4" ]; then
    echo "Exiting program..."
    exit 0

else
    echo "Invalid option selected."
fi