#!/bin/bash

echo "Enter the target IP range (e.g., 192.168.0.1/24): "
read target

echo "Starting scan..."
nmap -sn $target
echo "Scan completed."
