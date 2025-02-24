#!/bin/bash
PRIVATE_IP=$(hostname -I | awk '{print $1}')
echo "IP - $PRIVATE_IP" > /tmp/private-ip-address.txt