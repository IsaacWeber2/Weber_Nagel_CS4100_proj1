#!/bin/bash

# Ensure a directory name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 directory_name"
    exit 1
fi

# Define the directory containing the files to tokenize
EXAMPLES_DIR="./$1"

# Clear tokens.txt file
echo "" > tokens.txt

# Loop through each file in the directory
for file in "$EXAMPLES_DIR"/*
do
    # Tokenize the file using flex
    echo "Tokenizing $(basename $file)..."
    flex cmos.l
    g++ -o lexer lex.yy.c
    ./lexer < "$file" >> tokens.txt
    echo "Finished tokenizing $(basename $file)."
    echo "//*****************************************************************************************" >> tokens.txt
done

echo "Tokenization completed. Results stored in tokens.txt."
