#!/bin/bash

userid=SL973639
apikey=48393361daa8241d5db1624f6bf7382658c04a9d954e5db123dc8d328d804148

#Forming commands
Subnet_Command="curl -k -u '$userid:$apikey' -X POST -d @../Json/Subnet.json https://api.softlayer.com/rest/v3/SoftLayer_Network/6601/createSubnet/createObject.json -i"

#Create Filename appended with date
DT=`date +"%m-%d-%Y-%T"`
Filename="Subnet.Output.${DT}"

#Execute command and put output in the output file created above
echo "Executing command: $Subnet_Command"
Output="$($Subnet_Command)"
echo "Saving output in File : $Filename"
echo $Output > ../Output/$Filename

cat ../Output/$Filename
