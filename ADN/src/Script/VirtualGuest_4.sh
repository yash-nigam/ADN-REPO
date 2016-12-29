#!/bin/bash

userid=SL973639
apikey=48393361daa8241d5db1624f6bf7382658c04a9d954e5db123dc8d328d804148

#Forming commands
VirtualGuest_Command="curl -H \"Content-Type:application/json\" --data @../Json/Vm-app.json https://$userid:$apikey@api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest/createObject"


#Create Filename appended with date
DT=`date +"%m-%d-%Y-%T"`
Filename="VirtualGuest.Output.${DT}"

#Execute command and put output in the output file created above
echo "Executing command: $VirtualGuest_Command"
Output="$($VirtualGuest_Command)"
echo "Saving output in File : $Filename"
echo $Output > ../Output/$Filename

cat ../Output/$Filename
