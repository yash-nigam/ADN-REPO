#!/bin/bash

userid=SL973639
apikey=48393361daa8241d5db1624f6bf7382658c04a9d954e5db123dc8d328d804148

#Forming commands
BlockStorage_Command="curl -H \"Content-Type:application/json\" --data @../Json/BlockStorage.json https://$userid:$apikey@api.softlayer.com/rest/v3/SoftLayer_Product_Order/verifyOrder"

#Sample code to Create Filename appended with date
DT=`date +"%m-%d-%Y-%T"`
Filename="BlockStorage.Output.${DT}"

#Execute command and put output in the output file created above
echo "Executing command: $BlockStorage_Command"
Output="$($BlockStorage_Command)"
echo "Saving output in File : $Filename"
echo $Output > ../Output/$Filename

cat ../Output/$Filename
