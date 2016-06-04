@ECHO OFF
SETLOCAL

:: Change working directory.
cd Content

:: Build content with MonoGame Content Builder tool.
..\..\Source\MonoGame\Tools\MGCB\bin\Windows\AnyCPU\Release\MGCB.exe /@:Content-MonoGame-iOS.mgcb || GOTO error

:: ZIP content.
..\..\Tools\Pack\bin\x64\Release\Pack.exe --output bin\MonoGame\iOS\Content.zip --recursive --directory bin\MonoGame\iOS\Content *.* || GOTO error

cd ..

ECHO.
ECHO SUCCESS - Content build successful.
PAUSE
EXIT

:error
ECHO.
ECHO ERROR - Content build failed.
PAUSE
EXIT /B 1
