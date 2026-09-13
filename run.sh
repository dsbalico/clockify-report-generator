#!/usr/bin/env bash

# Clear the screen
clear

# Display a header
echo "=========================================================================="
echo "                          Week Selection Menu"
echo "=========================================================================="
echo ""
echo "Choose the week, enter a specific date, select a date range, or generate by month:"
echo ""
echo "1. Current"
echo "2. Previous"
echo "3. Enter a date"
echo "4. Enter a date range"
echo "5. Enter month and year (YYYY-MM) (auto weekly reports)"
echo ""

# Get the user's choice
read -p "Enter your choice (1-5): " sel

echo ""
echo "=========================================================================="

# Activate the virtual environment
if [ -f "./virtualenv/bin/activate" ]; then
    source "./virtualenv/bin/activate"
else
    echo "Virtual environment not found! Please ensure it is created and located at ./virtualenv."
    exit 1
fi

# Run based on selection
if [ "$sel" == "1" ]; then
    week="current"
    echo "You have selected $week."
    python3 app.py --week "$week"
elif [ "$sel" == "2" ]; then
    week="previous"
    echo "You have selected $week."
    python3 app.py --week "$week"
elif [ "$sel" == "3" ]; then
    read -p "Enter the date (YYYY-MM-DD): " week
    if [ -z "$week" ]; then
        echo "No date entered. Cancelled."
    else
        echo "You have selected $week."
        python3 app.py --week "$week"
    fi
elif [ "$sel" == "4" ]; then
    read -p "Enter the start date (YYYY-MM-DD): " start_date
    read -p "Enter the end date (YYYY-MM-DD): " end_date
    if [ -z "$start_date" ]; then
        echo "No start date entered. Cancelled."
    elif [ -z "$end_date" ]; then
        echo "No end date entered. Cancelled."
    else
        echo "You have selected the date range $start_date to $end_date."
        python3 app.py --start_date "$start_date" --end_date "$end_date"
    fi
elif [ "$sel" == "5" ]; then
    read -p "Enter month (YYYY-MM): " month_ym
    if [ -z "$month_ym" ]; then
        echo "No month entered. Cancelled."
    else
        echo "Generating weekly reports for $month_ym..."
        python3 app.py --month "$month_ym"
    fi
else
    echo "Invalid choice."
fi

echo ""
echo "==========================================================================="
echo ""
