#!/bin/bash

# System Information Tool

while true
do
    clear

    echo "=================================="
    echo "      Take Your Pick 2.0     "
    echo "=================================="
    echo ""
    echo "Welcome, select one of the following options using the number keys:"
    echo "1: Show System Info"
    echo "2: Show Disk Usage"
    echo "3: Show Current Users"
    echo "4: Exit"
    echo ""

    read -p "Enter your choice: " choice

    echo ""

    if [ "$choice" = "1" ]; then

        echo "===== System Information ====="
        echo ""

        echo "Operating System:"
        cat /etc/os-release | grep PRETTY_NAME

        echo ""
        echo "Hostname:"
        hostname

        echo ""
        echo "Kernel Version:"
        uname -r

        echo ""
        echo "System Uptime:"
        uptime -p

    elif [ "$choice" = "2" ]; then

        echo "===== Disk Usage ====="
        echo ""

        df -h

    elif [ "$choice" = "3" ]; then

        echo "===== Current Users ====="
        echo ""

        echo "Logged-in Users:"
        who

        echo ""
        echo "Running Applications/Processes:"
        ps -u $(who | awk '{print $1}' | sort | uniq)

    elif [ "$choice" = "4" ]; then

        echo "Exiting program..."
        exit 0

    else

        echo "Invalid option selected."

    fi

    echo ""
    read -p "Press Enter to return to the menu..."
done