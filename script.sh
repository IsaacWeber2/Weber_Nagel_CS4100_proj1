#!/bin/bash

# Empty the tokens.txt file
> tokens.txt

# Loop over the files
for i in {01..54}
do
  echo "Processing file: bills_$i.c"
  
  # Add filename to tokens.txt
  echo "bills_$i.c" >> tokens.txt
  
  # Run lexer and append output to tokens.txt
  ./lexer < examples/bills_$i.c >> tokens.txt
  
  # Add a newline before the next file output
  echo "" >> tokens.txt
done

echo "Tokenization complete."
