@echo off
setlocal

set OUTPUT=..\main\flite_voice_list.c

del /f %OUTPUT%

echo /* Generated automatically from make_voice_list */>%OUTPUT%
echo.>>%OUTPUT%
echo #include "flite.h">>%OUTPUT%
echo.>>%OUTPUT%
for %%i in (%*) do (
    echo cst_voice *register_%%i^(const char *voxdir^);>>%OUTPUT%
)

echo.>>%OUTPUT%
echo cst_val *flite_set_voice_list^(void^)>>%OUTPUT%
echo {>>%OUTPUT%
for %%i in (%*) do (
    echo    flite_voice_list = cons_val^(voice_val^(register_%%i^(NULL^)^),flite_voice_list^);>>%OUTPUT%
)
echo    flite_voice_list = val_reverse^(flite_voice_list^);>>%OUTPUT%
echo    return flite_voice_list;>>%OUTPUT%

echo }>>%OUTPUT%
echo.>>%OUTPUT%

