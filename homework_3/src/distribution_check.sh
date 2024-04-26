#!/bin/bash

# Check distribution
if [ "$(uname -s)" != "Linux" ]; then
	    echo "Error: This script only supports Linux distributions."
	        exit 1
fi

# Check if distribution is Ubuntu
if [ "$(lsb_release -si)" != "Ubuntu" ]; then
	    echo "Error: This script only supports Ubuntu distribution."
	        exit 1
fi

# Log CPU usage for the last hour
top -b -n 1 -d 3600 | grep 'Cpu(s)' > cpu-usage.log
