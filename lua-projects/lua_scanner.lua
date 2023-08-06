#!/usr/bin/lua

print("Enter the target IP range (e.g., 192.168.0.1/24): ")
local target = io.read()

print("Starting scan...")
os.execute("nmap -sn " .. target)
print("Scan completed.")
