#!/bin/bash

# Define an array of fruits
fruits=("Apple" "Pear" "Plum" "Cherry" "Orange")

# Loop through the array and print each fruit on a separate line
for fruit in "${fruits[@]}"; do
    echo "$fruit"
done

