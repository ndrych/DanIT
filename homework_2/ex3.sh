#!/bin/bash

# Ask user to enter the name of the file
echo "Please enter the name of the file:"
read filename

# Check if the file exists
if [ -e "$filename" ]; then
    echo "The file '$filename' exists in the current directory."
else
    echo "The file '$filename' does not exist in the current directory."
fi


