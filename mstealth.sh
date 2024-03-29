#!/bin/bash
# v0.1
# - uses SYN scan instead of the default
echo "Enter IP to scan"
read toscan
echo "Enter interface to scan on"
read interf
masscan -p1-65535,U1:65535 $toscan --rate=1000 -e $interf > ports.txt
ports=$(cat ports.txt | awk -F " " '{print $4}' | awk -F "/" '{print $1}' | sort -n | tr '\n' ',' | sed 's/,$//')
nmap -Pn -sS -p$ports $toscan > nmap-out.txt
echo "Scan complete, see ports.txt,nmap-out.txt"
