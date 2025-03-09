@echo off
:: Cursor Project Setup Agent - FINAL VERSION (Windows)
:: This script automatically creates all necessary Cursor files for a new project
:: with pre-populated values and minimal input required.

:: Print welcome message
echo =====================================================
echo 🤖 CURSOR SETUP AGENT - FINAL VERSION (Windows) 🤖
echo =====================================================
echo This script will create all necessary Cursor files for your new project.
echo Most values are pre-populated. Just answer a few simple questions.
echo =====================================================
echo.

:: Ask only essential project information
set /p PROJECT_NAME="Project name: "
set /p PROJECT_PATH="Project location (full path): "
set /p PROJECT_DESCRIPTION="Brief project description: "
set /p FRONTEND="Frontend tech [React, Next.js, TypeScript, Tailwind CSS]: "
set /p BACKEND="Backend tech [Next.js API routes]: "
set /p DATABASE="Database [Firebase Firestore]: "

:: Set defaults if empty
if "%FRONTEND%"=="" set FRONTEND=React, Next.js, TypeScript, Tailwind CSS
if "%BACKEND%"=="" set BACKEND=Next.js API routes
if "%DATABASE%"=="" set DATABASE=Firebase Firestore

:: Create project directory if it doesn't exist
mkdir "%PROJECT_PATH%" 2>nul
mkdir "%PROJECT_PATH%\instructions" 2>nul

:: Create .cursorrules file with pre-populated values
echo # %PROJECT_NAME% > "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Project Overview >> "%PROJECT_PATH%\.cursorrules"
echo This is a %PROJECT_DESCRIPTION%. >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Personality >> "%PROJECT_PATH%\.cursorrules"
echo Teach me like a senior developer would. Be concise but thorough. Prioritize clean, maintainable code over complex solutions. The fewer lines of code, the better. Always explain your reasoning in comments. >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Tech Stack >> "%PROJECT_PATH%\.cursorrules"
echo - Frontend: %FRONTEND% >> "%PROJECT_PATH%\.cursorrules"
echo - Backend: %BACKEND% >> "%PROJECT_PATH%\.cursorrules"
echo - Database: %DATABASE% >> "%PROJECT_PATH%\.cursorrules"
echo - Authentication: OAuth 2.0 / JWT >> "%PROJECT_PATH%\.cursorrules"
echo - Styling: Tailwind CSS >> "%PROJECT_PATH%\.cursorrules"
echo - State Management: React Context API / React Query >> "%PROJECT_PATH%\.cursorrules"
echo - Deployment: Vercel >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Environment Variables >> "%PROJECT_PATH%\.cursorrules"
echo ``` >> "%PROJECT_PATH%\.cursorrules"
echo # Database >> "%PROJECT_PATH%\.cursorrules"
echo DATABASE_URL= >> "%PROJECT_PATH%\.cursorrules"
echo DATABASE_USERNAME= >> "%PROJECT_PATH%\.cursorrules"
echo DATABASE_PASSWORD= >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo # Authentication >> "%PROJECT_PATH%\.cursorrules"
echo AUTH_SECRET= >> "%PROJECT_PATH%\.cursorrules"
echo AUTH_URL= >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo # API Keys >> "%PROJECT_PATH%\.cursorrules"
echo API_KEY= >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo # Other >> "%PROJECT_PATH%\.cursorrules"
echo NODE_ENV=development >> "%PROJECT_PATH%\.cursorrules"
echo ``` >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Current File Structure >> "%PROJECT_PATH%\.cursorrules"
echo ``` >> "%PROJECT_PATH%\.cursorrules"
echo /src >> "%PROJECT_PATH%\.cursorrules"
echo   /app >> "%PROJECT_PATH%\.cursorrules"
echo     /api >> "%PROJECT_PATH%\.cursorrules"
echo     /pages >> "%PROJECT_PATH%\.cursorrules"
echo   /components >> "%PROJECT_PATH%\.cursorrules"
echo     /ui >> "%PROJECT_PATH%\.cursorrules"
echo     /features >> "%PROJECT_PATH%\.cursorrules"
echo   /lib >> "%PROJECT_PATH%\.cursorrules"
echo     /utils >> "%PROJECT_PATH%\.cursorrules"
echo     /services >> "%PROJECT_PATH%\.cursorrules"
echo     /hooks >> "%PROJECT_PATH%\.cursorrules"
echo   /types >> "%PROJECT_PATH%\.cursorrules"
echo /public >> "%PROJECT_PATH%\.cursorrules"
echo   /assets >> "%PROJECT_PATH%\.cursorrules"
echo ``` >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## GitHub Push Process >> "%PROJECT_PATH%\.cursorrules"
echo 1. Check which branch you're on >> "%PROJECT_PATH%\.cursorrules"
echo 2. Make sure to switch to your correct branch >> "%PROJECT_PATH%\.cursorrules"
echo 3. Push with a clear commit message that describes the changes >> "%PROJECT_PATH%\.cursorrules"
echo 4. Verify the push was successful >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Error Fixing Process >> "%PROJECT_PATH%\.cursorrules"
echo 1. Explain the error in simple terms >> "%PROJECT_PATH%\.cursorrules"
echo 2. Write three reasoning paragraphs analyzing what the error might be >> "%PROJECT_PATH%\.cursorrules"
echo 3. Do not jump to conclusions >> "%PROJECT_PATH%\.cursorrules"
echo 4. Propose a solution only after thorough analysis >> "%PROJECT_PATH%\.cursorrules"
echo 5. Implement the fix with clear comments >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Important Instructions >> "%PROJECT_PATH%\.cursorrules"
echo - Always add detailed comments to explain complex logic >> "%PROJECT_PATH%\.cursorrules"
echo - Use TypeScript interfaces for all data structures >> "%PROJECT_PATH%\.cursorrules"
echo - Follow the existing folder structure >> "%PROJECT_PATH%\.cursorrules"
echo - Keep components modular and reusable >> "%PROJECT_PATH%\.cursorrules"
echo - Optimize for mobile responsiveness >> "%PROJECT_PATH%\.cursorrules"
echo - Implement proper error handling >> "%PROJECT_PATH%\.cursorrules"
echo - The fewer lines of code, the better >> "%PROJECT_PATH%\.cursorrules"
echo - Do not stop working until you've implemented features fully and completely >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Other Context >> "%PROJECT_PATH%\.cursorrules"
echo - This project is designed with a mobile-first approach >> "%PROJECT_PATH%\.cursorrules"
echo - The UI follows modern design principles with clean, simple interfaces >> "%PROJECT_PATH%\.cursorrules"
echo - We prioritize accessibility and performance >> "%PROJECT_PATH%\.cursorrules"
echo. >> "%PROJECT_PATH%\.cursorrules"
echo ## Comments >> "%PROJECT_PATH%\.cursorrules"
echo Comments are extremely important in this codebase. Always include: >> "%PROJECT_PATH%\.cursorrules"
echo - Purpose of each file at the top >> "%PROJECT_PATH%\.cursorrules"
echo - Function descriptions >> "%PROJECT_PATH%\.cursorrules"
echo - Complex logic explanations >> "%PROJECT_PATH%\.cursorrules"
echo - TODO items for future improvements >> "%PROJECT_PATH%\.cursorrules"
echo - References to related files or components >> "%PROJECT_PATH%\.cursorrules"

:: Create .cursorignoree file
echo # .cursorignoree - Files that Cursor should not modify > "%PROJECT_PATH%\.cursorignoree"
echo. >> "%PROJECT_PATH%\.cursorignoree"
echo # Environment variables >> "%PROJECT_PATH%\.cursorignoree"
echo .env >> "%PROJECT_PATH%\.cursorignoree"
echo .env.local >> "%PROJECT_PATH%\.cursorignoree"
echo .env.development >> "%PROJECT_PATH%\.cursorignoree"
echo .env.production >> "%PROJECT_PATH%\.cursorignoree"
echo .env.example >> "%PROJECT_PATH%\.cursorignoree"
echo. >> "%PROJECT_PATH%\.cursorignoree"
echo # Generated files >> "%PROJECT_PATH%\.cursorignoree"
echo node_modules/ >> "%PROJECT_PATH%\.cursorignoree"
echo .next/ >> "%PROJECT_PATH%\.cursorignoree"
echo dist/ >> "%PROJECT_PATH%\.cursorignoree"
echo build/ >> "%PROJECT_PATH%\.cursorignoree"
echo out/ >> "%PROJECT_PATH%\.cursorignoree"
echo coverage/ >> "%PROJECT_PATH%\.cursorignoree"
echo .coverage/ >> "%PROJECT_PATH%\.cursorignoree"
echo .cache/ >> "%PROJECT_PATH%\.cursorignoree"
echo. >> "%PROJECT_PATH%\.cursorignoree"
echo # Large data files >> "%PROJECT_PATH%\.cursorignoree"
echo *.csv >> "%PROJECT_PATH%\.cursorignoree"
echo *.json >> "%PROJECT_PATH%\.cursorignoree"
echo *.xml >> "%PROJECT_PATH%\.cursorignoree"
echo *.sql >> "%PROJECT_PATH%\.cursorignoree"
echo *.db >> "%PROJECT_PATH%\.cursorignoree"
echo. >> "%PROJECT_PATH%\.cursorignoree"
echo # Binary files >> "%PROJECT_PATH%\.cursorignoree"
echo *.jpg >> "%PROJECT_PATH%\.cursorignoree"
echo *.jpeg >> "%PROJECT_PATH%\.cursorignoree"
echo *.png >> "%PROJECT_PATH%\.cursorignoree"
echo *.gif >> "%PROJECT_PATH%\.cursorignoree"
echo *.ico >> "%PROJECT_PATH%\.cursorignoree"
echo *.svg >> "%PROJECT_PATH%\.cursorignoree"
echo *.pdf >> "%PROJECT_PATH%\.cursorignoree"
echo *.zip >> "%PROJECT_PATH%\.cursorignoree"
echo *.tar.gz >> "%PROJECT_PATH%\.cursorignoree"
echo *.mp3 >> "%PROJECT_PATH%\.cursorignoree"
echo *.mp4 >> "%PROJECT_PATH%\.cursorignoree"
echo *.woff >> "%PROJECT_PATH%\.cursorignoree"
echo *.woff2 >> "%PROJECT_PATH%\.cursorignoree"
echo *.ttf >> "%PROJECT_PATH%\.cursorignoree"
echo *.eot >> "%PROJECT_PATH%\.cursorignoree"
echo. >> "%PROJECT_PATH%\.cursorignoree"
echo # Sensitive files >> "%PROJECT_PATH%\.cursorignoree"
echo **/credentials*.json >> "%PROJECT_PATH%\.cursorignoree"
echo **/key*.json >> "%PROJECT_PATH%\.cursorignoree"
echo **/secret*.json >> "%PROJECT_PATH%\.cursorignoree"
echo **/service-account*.json >> "%PROJECT_PATH%\.cursorignoree"
echo *.pem >> "%PROJECT_PATH%\.cursorignoree"
echo *.key >> "%PROJECT_PATH%\.cursorignoree"
echo *.cert >> "%PROJECT_PATH%\.cursorignoree"
echo. >> "%PROJECT_PATH%\.cursorignoree"
echo # Specific project files that should not be modified >> "%PROJECT_PATH%\.cursorignoree"
echo package-lock.json >> "%PROJECT_PATH%\.cursorignoree"
echo yarn.lock >> "%PROJECT_PATH%\.cursorignoree"
echo pnpm-lock.yaml >> "%PROJECT_PATH%\.cursorignoree"

:: Create a simplified README for using these scripts
echo # Cursor Setup Instructions > "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo ## How to Setup Cursor for This Project >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo 1. Make sure you have [Cursor](https://cursor.sh) installed >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo 2. Open your project folder in Cursor >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo 3. Cursor will automatically detect the `.cursorrules` and `.cursorignoree` files >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo 4. Start developing with enhanced AI assistance! >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo ## Key Files >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo - `.cursorrules`: Contains project context and personality settings >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo - `.cursorignoree`: Lists files that Cursor should not modify >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo - `CURSOR_BEST_PRACTICES.md`: Tips for working with Cursor in this project >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo - `instructions/`: Folder with detailed information about specific aspects of the project >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo ## For New Projects >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo To create Cursor setup files for a new project: >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo - Windows: Run `cursor-setup-agent.bat` >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo - Mac/Linux: Run `bash cursor-setup-agent.sh` >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"
echo. >> "%PROJECT_PATH%\CURSOR_SETUP_INSTRUCTIONS.md"

echo.
echo =====================================================
echo ✅ SUCCESS! All Cursor files have been created at %PROJECT_PATH%
echo ✅ The files are pre-populated with sensible defaults.
echo =====================================================
echo.
echo NEXT STEPS:
echo 1. Open your project in Cursor
echo 2. Start developing with improved AI assistance
echo 3. For your next project, just run this script again!
echo =====================================================

pause