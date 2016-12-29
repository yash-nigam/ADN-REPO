#!/bin/bash

userid=SL973639
apikey=48393361daa8241d5db1624f6bf7382658c04a9d954e5db123dc8d328d804148

#Forming commands
Baremetal_Command="curl -H \"Content-Type:application/json\" --data @../Json/Baremetal.json https://$userid:$apikey@api.softlayer.com/rest/v3/SoftLayer_Product_Order/placeOrder"

#Create Filename appended with date
DT=`date +"%m-%d-%Y-%T"`
Filename="Baremeta.Output.${DT}"

#Execute command and put output in the output file created above
echo "Executing command: $Baremetal_Command"
Output="$($Baremetal_Command)"
echo "Saving output in File : $Filename"
echo $Output > ../Output/$Filename

cat ../Output/$Filename
