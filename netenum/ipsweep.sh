#!/bin/bash

# Subnet to scan
read -p "IP Subnet > " SUBNET

echo "Starting IP sweep on subnet $SUBNET.0/24"

# Loop through the range of IP addresses
for i in {1..254}
do
    IP="$SUBNET.$i"
    
    # Ping the IP address and check if it's up
    ping -c 1 $IP | grep ^64 | awk "{print $4}" | cut -d ":" -f 1 &
done

echo "IP sweep completed."
