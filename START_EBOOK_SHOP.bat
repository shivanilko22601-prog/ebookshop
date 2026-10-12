@echo off
setlocal
set "JAVA_HOME=C:\Users\DELL\Downloads\jdk-27"
set "CATALINA_HOME=C:\Users\DELL\Downloads\apache-tomcat-10.1.60"
set "PATH=%JAVA_HOME%\bin;%PATH%"

if not exist "%CATALINA_HOME%\bin\startup.bat" (
  echo Tomcat was not found at:
  echo %CATALINA_HOME%
  echo Check that the Tomcat ZIP was extracted to Downloads.
  pause
  exit /b 1
)

call "%CATALINA_HOME%\bin\startup.bat"
timeout /t 6 /nobreak >nul
start "" "http://localhost:8080/ebshop/"
endlocal
