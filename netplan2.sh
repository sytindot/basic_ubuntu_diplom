#!/bin/bash
cp /etc/netplan 9999-network-ubuntu-master.yaml
netplan try
netplan apply
netplan generate
