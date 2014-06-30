@echo off
setlocal

set OUTPUT=..\include\flite_version.h

if exist %OUTPUT% del /f %OUTPUT%

for /f "usebackq tokens=1,2 delims== " %%i in (`findstr /r /c:^PROJECT_ ..\config\project.mak`) do (
    echo #define FLITE_%%i "%%j">>%OUTPUT%
)
