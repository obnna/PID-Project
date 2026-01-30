#!/usr/bin/env bash

# Simple PID inspection tool
# Prints process name, parent, children, and network connections

pid="$1"

# Validate input
if [[ -z "$pid" ]]; then
    echo "Usage: $0 <PID>"
    exit 1
fi

if ! [[ "$pid" =~ ^[0-9]+$ ]]; then
    echo "Error: PID must be a number"
    exit 1
fi

if ! ps -p "$pid" > /dev/null 2>&1; then
    echo "Error: PID not found"
    exit 1
fi

# Get process name
get_name() {
    ps -p "$1" -o comm= 2>/dev/null
}

# Get parent PID
get_parent() {
    ps -p "$1" -o ppid= 2>/dev/null
}

# Get children PIDs
get_children() {
    pgrep -P "$1"
}

# Get network connections (using ss instead of deprecated netstat)
get_network() {
    ss -tulpn 2>/dev/null | grep "$1" | awk '{print $5}' | sort -u
}

echo "Process: $pid ($(get_name "$pid"))"
echo

# Parent
parent=$(get_parent "$pid")
if [[ -n "$parent" && "$parent" -gt 0 ]]; then
    echo "Parent: $parent ($(get_name "$parent"))"
else
    echo "Parent: None"
fi
echo

# Children
echo "Children:"
children=$(get_children "$pid")
if [[ -z "$children" ]]; then
    echo "  None"
else
    for c in $children; do
        echo "  $c ($(get_name "$c"))"
    done
fi
echo

# Network connections
echo "Network Connections:"
net=$(get_network "$pid")
if [[ -z "$net" ]]; then
    echo "  None"
else
    echo "$net" | sed 's/^/  /'
fi
