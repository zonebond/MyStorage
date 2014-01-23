@echo off

set "CURRENT_DIR=%cd%"

set cmd=%1
if "%cmd%"=="" goto show_welcome
if "%WEB_ENV_TEMP%" == "" goto error_not_exist
cd "%WEB_ENV_TEMP%"\bin

if %cmd%==start goto start
if %cmd%==stop goto stop
if %cmd%==restart goto restart

if %cmd%==conf goto conf_dir
if %cmd%==version goto version

goto end


:show_welcome
echo ------ "Welcome to Tomcat Base" ------
 echo.
 echo.
echo commands: start / stop / restart
 echo.
echo exp:
 echo.
echo -------------
 echo.
echo "tomcat [command]"
 echo.
set "tomcat_bin = abc"
goto end

:start
call startup.bat
goto end

:stop
call shutdown.bat
goto end

:restart
call shutdown.bat && call startup.bat
goto end

:version
call version.bat
pause
goto end

:conf_dir
set file_name=%2
if "%file_name%"=="" goto error_conf
cd ../conf
if not exist %file_name%.xml goto error_not_exist
start notepad %file_name%.xml && goto end
exit

:error_conf
echo Please enter a configuration file name!
goto end

:error_not_exist
echo The target [Directory] or [File] is not exist!
goto end

:end
cd "%CURRENT_DIR%"
