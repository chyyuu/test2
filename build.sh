#!/bin/bash

# Define the output file
output_file="oscourse.mm.md"

# Start with the initial file
cat os.mm.md > "$output_file"

# Loop through lecture numbers 1 to 7
for i in {1..7}; do
    # Concatenate main lecture file first
    cat "mindmap/lec$i/lec$i.mm.md" >> "$output_file"
    
    # Find all p*.mm.md files, sort them numerically and concatenate them
    find "mindmap/lec$i" -name "p*.mm.md" | sort -V | xargs cat >> "$output_file"
done

markmap --no-open --offline --output oscourse.html oscourse.mm.md