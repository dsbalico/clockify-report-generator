@echo off
setlocal EnableDelayedExpansion

:: Clear the screen
cls

:: Display a header
echo ==========================================================================
echo                           Week Selection Menu
echo ==========================================================================
echo.
echo Choose the week, enter a specific date, select a date range, or generate by month:
echo.
echo 1. Current
echo 2. Previous
echo 3. Enter a date
echo 4. Enter a date range
echo 5. Enter month and year (YYYY-MM) (auto weekly reports)
echo.

:: Get the user's choice
choice /c 12345 /m "Enter your choice: "

:: Capture immediately so errorlevel doesn't get overwritten
set "sel=%errorlevel%"

echo.
echo ==========================================================================

:: Activate the virtual environment (adjust if your venv folder name is different)
call ".\virtualenv\Scripts\activate.bat"

:: Run based on selection
if "%sel%"=="1" (
    set "week=current"
    echo You have selected !week!.
    python app.py --week !week!
) else if "%sel%"=="2" (
    set "week=previous"
    echo You have selected !week!.
    python app.py --week !week!
) else if "%sel%"=="3" (
    set "week="
    set /p week="Enter the date (YYYY-MM-DD): "
    if "!week!"=="" (
        echo No date entered. Cancelled.
        goto :done
    )
    echo You have selected !week!.
    python app.py --week "!week!"
) else if "%sel%"=="4" (
    set "start_date="
    set "end_date="
    set /p start_date="Enter the start date (YYYY-MM-DD): "
    set /p end_date="Enter the end date (YYYY-MM-DD): "
    if "!start_date!"=="" (
        echo No start date entered. Cancelled.
        goto :done
    )
    if "!end_date!"=="" (
        echo No end date entered. Cancelled.
        goto :done
    )
    echo You have selected the date range !start_date! to !end_date!.
    python app.py --start_date "!start_date!" --end_date "!end_date!"
) else if "%sel%"=="5" (
    set "month_ym="
    set /p month_ym="Enter month (YYYY-MM): "
    if "!month_ym!"=="" (
        echo No month entered. Cancelled.
        goto :done
    )
    echo Generating weekly reports for !month_ym!...
    python app.py --month "!month_ym!"
) else (
    echo Invalid choice.
)

:done
echo.
echo ===========================================================================
echo.

:: Pause to allow the user to see the results
pause

:: End the script
endlocal

:: sample calls without bat:
:: python app.py --week current
:: python app.py --week previous
:: python app.py --week 2024-08-12
:: python app.py --start_date 2024-08-12 --end_date 2024-08-16
:: python app.py --month 2025-06
