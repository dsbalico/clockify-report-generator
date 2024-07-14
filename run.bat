@echo off
setlocal

:: Clear the screen
cls

:: Display a header
echo ==========================================================================
echo                           Week Selection Menu
echo ==========================================================================
echo.
:: Prompt user to choose a week
echo Choose the week:
echo.
echo 1. Current
echo 2. Previous
echo.

:: Get the user's choice
choice /c 12 /m "Enter your choice:"

echo.
echo ==========================================================================

:: Set the week variable based on user's choice
if errorlevel 1 set week=current
if errorlevel 2 set week=previous

:: Provide feedback to the user
echo.
echo You have selected the %week% week.
echo.
echo ==========================================================================
echo.

:: Activate the virtual environment and run the Python script
call ./virtualenv/scripts/activate
python app.py --week %week%

echo.
echo ===========================================================================

:: Pause to allow the user to see the results
pause

:: End the script
endlocal
