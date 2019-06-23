#!/bin/bash
echo "Enter ip range to scan"
read toscan
nmap -sn $toscan | grep for | awk -F " " '{print $5}'
