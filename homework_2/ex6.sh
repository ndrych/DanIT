#!/bin/bash

# Prompt the user to enter a sentence
echo "Please enter a sentence:"
read -r sentence

# Split the sentence into words and store them in an array
IFS=' ' read -r -a words <<< "$sentence"

# Reverse the order of words in the array
reverse_sentence=""
for ((i=${#words[@]}-1; i>=0; i--)); do
    reverse_sentence+=" ${words[i]}"
done

# Remove leading whitespace
reverse_sentence="${reverse_sentence# }"

# Print the reversed sentence
echo "Reversed sentence: $reverse_sentence"

