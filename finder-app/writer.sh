#!/bin/bash
# Writer script for assignment 1 
# Author: Sai Pranav Teja Y

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Incorrect number of arguments provided."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Extract arguments
writefile="$1"
writestr="$2"

# Check if writefile argument is provided
if [ -z "$writefile" ]; then
    echo "Error: Path to the file to be written is not provided."
    exit 1
fi

# Check if writestr argument is provided
if [ -z "$writestr" ]; then
    echo "Error: Text string to be written is not provided."
    exit 1
fi

# Create the directory path if it doesn't exist
writefile_dir=$(dirname "$writefile")
if [ ! -d "$writefile_dir" ]; then
    mkdir -p "$writefile_dir"
fi

# Write the string to the file, overwriting any existing content
echo "$writestr" > "$writefile"

# Check if file was successfully created
if [ $? -ne 0 ]; then
    echo "Error: Failed to create file '$writefile'."
    exit 1
fi

echo "File '$writefile' created with content '$writestr'."
exit 0
