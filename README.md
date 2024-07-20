# 🕰️ Clockify Report Generator

![Clockify Logo](https://clockify.me/assets/images/clockify-logo.png)

## 🌟 Overview

The Clockify Report Generator is a powerful Python-based tool designed to streamline the process of creating weekly accomplishment reports from Clockify time entries. By leveraging the Clockify API, this application fetches time data, processes it, and generates a professional Excel report based on a customizable template.

## ✨ Features

- 🔗 **API Integration**: Seamlessly fetches time entries from the Clockify API.
- 📅 **Flexible Time Selection**: Generate reports for the current or previous week.
- 🔄 **Data Transformation**: Processes raw time data into a structured format.
- 📊 **Excel Report Generation**: Creates polished reports using a predefined Excel template.
- 🌐 **Timezone Support**: Handles time conversions to your local timezone.
- 🖥️ **User-Friendly Interface**: Includes a Windows batch script for easy execution.
- 🎨 **Customizable Output**: Generates uniquely named files based on user and date information.

## 📋 Prerequisites

Before you begin, ensure you have the following:

- 🐍 Python 3.7 or higher
- 🔑 A Clockify account with API access
- 📘 Microsoft Excel (for viewing generated reports)
- 🐙 Git (for cloning the repository)

## 🚀 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/clockify-report-generator.git
   cd clockify-report-generator
   ```

2. Set up a virtual environment:
   ```bash
   python -m venv virtualenv
   ```

3. Activate the virtual environment:
   - Windows:
     ```bash
     .\virtualenv\Scripts\activate
     ```
   - macOS/Linux:
     ```bash
     source virtualenv/bin/activate
     ```

4. Install required packages:
   ```bash
   pip install -r requirements.txt
   ```

## ⚙️ Configuration

1. Create a `.env` file in the project root directory.
2. Add your Clockify configuration:
   ```
   WORKSPACE_ID=your_workspace_id
   USER_ID=your_user_id
   API_KEY=your_api_key
   POSITION=your_position
   BASE_URL=https://api.clockify.me/api/v1
   TIMEZONE=Asia/Manila
   ```
   Replace the values with your actual Clockify details.

## 🖥️ Usage

### Using the Python Script

Run the script with the following command:

```bash
python app.py --week [current|previous]
```

Replace `[current|previous]` with your desired option.

### Using the Batch Script (Windows)

1. Double-click the `run.bat` file.
2. Follow the on-screen prompts to select the desired week.
3. The script will execute and generate the report automatically.

## 📁 Project Structure

```
clockify-report-generator/
│
├── 📜 app.py                 # Main application script
├── 📜 configuration.py       # Configuration loader
├── 📜 api_client.py          # Clockify API client
├── 📜 data_processing.py     # Data processing functions
├── 📜 run.bat                # Windows batch script
├── 📜 requirements.txt       # Python dependencies
├── 📊 template.xlsx          # Excel report template
│
├── 📁 utils/
│   └── 📜 logger.py          # Logging configuration
│
└── 📁 output/                # Generated reports directory
```

## 📤 Output

Generated reports are saved in the `output/` directory with the following naming convention:

```
Accomplishment Report [MMYYYY Week#N] - LastName, FirstName, MiddleInitial..xlsx
```

- `MMYYYY`: Month and year
- `N`: Week number of the month
- `LastName`, `FirstName`, `MiddleInitial`: User's name from Clockify

## 🎨 Customization

- 📊 **Excel Template**: Modify `template.xlsx` to change the report layout.
- 🌐 **Timezone**: Adjust the `TIMEZONE` variable in the `.env` file to match your locale.
- 📝 **Output Format**: Edit the `generate_filename()` function in `app.py` to change the output file naming convention.

## 🔧 Troubleshooting

- 🔌 **API Connection Issues**: Verify your API key and internet connection.
- 🕰️ **Incorrect Time Data**: Ensure your Clockify workspace timezone settings are correct.
- 📊 **Excel Template Errors**: Make sure `template.xlsx` is in the project root and follows the expected format.
