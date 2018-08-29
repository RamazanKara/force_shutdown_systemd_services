#!/bin/bash
#Input your service
read -e -i "$dienst" -p "Please enter the name of the service that should be shutdown: " input
dienst="${input}"
#creating an override
mkdir -p /etc/systemd/system/$dienst.d
cat > /etc/systemd/system/$dienst.d/override.conf <<EOF
[Service]
TimeoutStopSec=10
EOF

#check if script works
if [ "`systemctl show $dienst -p TimeoutStopUSec `" != "TimeoutStopUSec=10s" ] 
then

 echo "$Dienst didnt shutdown. Something went wrong."

else
	
	chmod 751 /etc/systemd/system/$dienst.d/
	chmod 644 /etc/systemd/system/$dienst.d/override.conf
	systemctl daemon-reload
	echo "Shutdown of $Dienst in 10 seconds "
    systemctl restart $dienst
exit 0
fi