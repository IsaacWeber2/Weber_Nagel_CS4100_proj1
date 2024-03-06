#!/bin/bash

# Ensure a directory name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 examples"
    exit 1
fi

# Define the directory containing the files to tokenize
FILES="./$1/*"

# Clear tokens.txt file
rm -f tokens.txt

# Loop through each file in the directory
for f in $FILES
do
    echo "Tokenizing $(basename $f) file..."
    # Perform lexical analysis using the scanner and append output to tokens.txt
    ./lexer < $f >> tokens.txt
    echo "Finished tokenizing $(basename $f)."
done

echo "Tokenization completed. Results stored in tokens.txt."
