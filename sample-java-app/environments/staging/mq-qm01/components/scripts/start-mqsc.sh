#!/bin/bash
#
# A simple MVP script that will run sample-java-appSC against a queue manager.
ckksum=""

# Outer loop that keeps the sample-java-app service running
while true; do

   tmpCksum=`cksum /dynamic-sample-java-app-config-sample-java-appsc/dynamic-definitions.sample-java-appsc | cut -d" " -f1`

   if (( tmpCksum != cksum ))
   then
      cksum=$tmpCksum
      echo "Applying sample-java-appSC"
      runsample-java-appsc $1 < /dynamic-sample-java-app-config-sample-java-appsc/dynamic-definitions.sample-java-appsc
   else
      sleep 3
   fi

done
