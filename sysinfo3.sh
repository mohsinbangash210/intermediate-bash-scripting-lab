#!/bin/bash

# ==========================================
# System Information Tool
# ==========================================

# Help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "System Information Tool"
    echo ""
    echo "This script displays useful system information including:"
    echo " - Operating system details"
    echo " - Disk usage"
    echo " - Current logged-in users"
    echo " - Top CPU-Hog processes"
    echo ""
    echo "Usage:"
    echo "  ./sysinfo3.sh"
    echo "  ./sysinfo3.sh -h"
    echo "  ./sysinfo3.sh --help"
    exit 0
fi

# Function to display section headers
show_header() {
    echo "=================================================="
    echo "$1"
    echo "Generated: $(date)"
    echo "=================================================="
}

# Main menu loop
while true
do
    clear

    echo "=================================="
    echo "      Take Your Pick 3.0     "
    echo "=================================="
    echo ""
    echo "Welcome, select one of the following options using the number keys:"
    echo "1: Show System Info"
    echo "2: Show Disk Usage"
    echo "3: Show Current Users"
    echo "4: Show Top Processes"
    echo "5: Exit"
    echo ""

    read -p "Enter your choice: " choice

    echo ""

    if [ "$choice" = "1" ]; then

        show_header "SYSTEM INFORMATION"

        echo "Operating System:"
        grep PRETTY_NAME /etc/os-release

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

        show_header "DISK USAGE"

        df -h

    elif [ "$choice" = "3" ]; then

        show_header "CURRENT USERS"

        echo "Logged-in Users:"
        who

        echo ""
        echo "User Processes:"
        ps -u $(who | awk '{print $1}' | sort | uniq)

    elif [ "$choice" = "4" ]; then

        show_header "TOP 5 CPU-INTENSIVE PROCESSES"

        printf "+------+------------+--------+----------------------+\n"
        printf "| PID  | User       | CPU%%   | Command              |\n"
        printf "+------+------------+--------+----------------------+\n"

        ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6 | tail -n 5 | \
        awk '{printf "| %-4s | %-10s | %-6s | %-20s |\n", $1, $2, $3, $4}'

        printf "+------+------------+--------+----------------------+\n"

    elif [ "$choice" = "5" ]; then

        echo "Exiting program..."
        exit 0

    else

        echo "Invalid option selected."

    fi

    echo ""
    read -p "Press Enter to return to the menu..."

done