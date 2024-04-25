#!/bin/bash

# Assign arguments to variables
source_dir="$1"
destination_dir="$2"
filename="$3"

# Check if the source file exists
if [ ! -f "$source_dir/$filename" ]; then
    echo "Error: Source file '$filename' does not exist in directory '$source_dir'."
exit 1
fi

# Copy the file to the destination directory
cp "$source_dir/$filename" "$destination_dir"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "File '$filename' copied successfully from '$source_dir' to '$destination_dir'."
else
    echo "Error: Failed to copy file '$filename' from '$source_dir' to '$destination_dir'."
fi
