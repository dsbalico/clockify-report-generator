@echo off
setlocal

:: Clear the screen
cls

:: Display a header
echo ==========================================================================
echo                           Week Selection Menu
echo ==========================================================================
echo.
:: Prompt user to choose a week, enter a date, or a date range
echo Choose the week, enter a specific date, or select a date range:
echo.
echo 1. Current
echo 2. Previous
echo 3. Enter a date
echo 4. Enter a date range
echo.

:: Get the user's choice
choice /c 1234 /m "Enter your choice:"

echo.
echo ==========================================================================

:: Set the week, date, or date range variable based on user's choice
if %errorlevel%==1 (
    set week=current
) else if %errorlevel%==2 (
    set week=previous
) else if %errorlevel%==3 (
    set /p week="Enter the date (YYYY-MM-DD): "
) else if %errorlevel%==4 (
    set /p start_date="Enter the start date (YYYY-MM-DD): "
    set /p end_date="Enter the end date (YYYY-MM-DD): "
)

:: Provide feedback to the user
echo.
if %errorlevel%==4 (
    echo You have selected the date range %start_date% to %end_date%.
    python app.py --start_date %start_date% --end_date %end_date%
) else (
    echo You have selected %week%.
    python app.py --week %week%
)

echo.
echo ===========================================================================
echo.

:: Activate the virtual environment and run the Python script
call ./env/scripts/activate

:: Pause to allow the user to see the results
pause

:: End the script
endlocal

:: sample call without bat:
:: python app.py --start_date 2024-08-12 --end_date 2024-08-16