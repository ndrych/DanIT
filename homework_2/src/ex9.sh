#!/bin/bash

# Assign the filename argument to a variable
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' does not exist."
exit 1
fi

# Attempt to read the file and print its contents
if [ -r "$filename" ]; then
    echo "Contents of '$filename':"
    cat "$filename"
else
    echo "Error: Cannot read file '$filename'."
    exit 1
fi

