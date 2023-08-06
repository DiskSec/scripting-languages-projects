#!/bin/bash

# Function to check if a port is open on a target host
check_port() {
    target=$1
    port=$2

    timeout 1 bash -c "echo >/dev/tcp/$target/$port" && echo "Port $port is open on $target" || echo "Port $port is closed on $target"
}

# Usage function
usage() {
    echo "Usage: $0 <target_host> <start_port> <end_port>"
}

# Check if all arguments are provided
if [ $# -ne 3 ]; then
    usage
    exit 1
fi

target_host=$1
start_port=$2
end_port=$3

# Perform port scanning
for ((port = $start_port; port <= $end_port; port++)); do
    check_port "$target_host" "$port"
done
