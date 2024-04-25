#!/bin/bash

# Assign the filename argument to a variable
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' does not exist."
exit 1
fi

# Count the number of lines in the file and print the count
num_lines=$(wc -l < "$filename")
echo "Number of lines in '$filename': $num_lines"

