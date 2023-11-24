#!/bin/bash

# Function to unzip files in a directory
unzip_files() {
    local dir="$1"
    local zip_files=("$dir"/*.zip)
    
    # Check if there are any zip files in the directory
    if [ ${#zip_files[@]} -gt 0 ]; then
        for zip_file in "${zip_files[@]}"; do
            echo "Unzipping: $zip_file"
            unzip "$zip_file" -d "$dir"
        done
    fi

    # Recursively call the function for subdirectories
    local subdirs=("$dir"/*/)
    if [ ${#subdirs[@]} -gt 0 ]; then
        for subdir in "${subdirs[@]}"; do
            unzip_files "$subdir"
        done
    fi
}

# Check if a path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

# Get the absolute path of the provided directory
path=$(realpath "$1")

# Check if the path exists
if [ ! -d "$path" ]; then
    echo "Error: Directory not found: $path"
    exit 1
fi

# Call the function to unzip files recursively
unzip_files "$path"

echo "Unzipping complete."
