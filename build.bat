REM @ECHO off

ECHO "Starting .."

IF "%1%"=="" (
	SET dist="P:\x\vehicle_deploy_framework\addons\jrs_vehicle_deploy.pbo"
) ELSE (
	SET dist=%1%
)
ECHO %dist%

tools\makepbo.exe addons\jrs_vehicle_deploy\ %dist%
