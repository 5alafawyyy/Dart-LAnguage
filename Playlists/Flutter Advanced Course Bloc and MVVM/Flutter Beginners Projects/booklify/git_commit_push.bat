@echo off

rem Set your GitHub username and repository name
set github_username=5alafawyyy
set repo_name=Dart-Language-Flutter-Framework/Playlists/Flutter Advanced Course Bloc and MVVM/Flutter Beginners Projects/booklify

rem Prompt user for commit message
set /p commit_phrase="Enter commit message: "

rem Change to the directory where your Git repository is located
cd path\to\your\git\repository

rem Execute Git commands
git add .
git commit -m "%commit_phrase%"
git push -u origin main

echo.
echo Changes committed and pushed to GitHub.
echo.

pause
