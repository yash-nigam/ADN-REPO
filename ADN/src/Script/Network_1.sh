#!/bin/bash

userid=SL973639
apikey=48393361daa8241d5db1624f6bf7382658c04a9d954e5db123dc8d328d804148

#Forming commands
Network_Command="curl -H \"Content-Type:application/json\" --data @../Json/Network.json https://$userid:$apikey@api.softlayer.com/rest/v3.1/SoftLayer_Network/createObject"

#Code to Create Filename appended with date
DT=`date +"%m-%d-%Y-%T"`
Filename="Network.Output.${DT}"


#Code to execute command and put output in the output file created above
echo "Executing command: $Network_Command"
Output="$($Network_Command)"

echo "Saving output in File : $Filename"
echo $Output > ../Output/$Filename

cat ../Output/$Filename

