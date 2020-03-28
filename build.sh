if [ -z $1 ]
then
DIST="P:\x\vehicle_deploy_framework\addons\jrs_vehicle_deploy.pbo"
else
DIST=$1
fi

if [ ! -d /p/x/vehicle_deploy_framework ]
then
	mkdir -p /p/x/vehicle_deploy_framework/addons
fi

tools/makePbo addons/jrs_vehicle_deploy/ $DIST
