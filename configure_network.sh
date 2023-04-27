#!/bin/bash

sudo apt-get install -y bridge-utils

CONFIGFILE=$(ls /etc/netplan/*)
cp $CONFIGFILE /tmp/mini-pupper.yaml
sed -i "/version: 2/d" /tmp/mini-pupper.yaml

cat >> /tmp/mini-pupper.yaml << EOF
    bridges:
        br0:
            addresses: [10.0.0.10/24]
            parameters:
                stp: true
                forward-delay: 4
            dhcp4: false
            optional: true
    version: 2
EOF

sudo rm -f /etc/netplan/*
sudo cp /tmp/mini-pupper.yaml /etc/netplan/
sudo netplan apply
