#!/bin/bash

SG_ID=$1
IP_ADDRESSES=() # Array of IP addresses
IP_RANGES=""

for IP in ${IP_ADDRESSES[@]}
do
    IP_RANGES+="{CidrIp=$IP/32},"
done

# 後方一致除去
IP_RANGES=${IP_RANGES/%?/}
IP_RANGES="[${IP_RANGES}]"

echo $IP_RANGES

aws ec2 authorize-security-group-ingress \
    --group-id ${SG_ID} \
    --ip-permissions IpProtocol=tcp,FromPort=443,ToPort=443,IpRanges=${IP_RANGES}
