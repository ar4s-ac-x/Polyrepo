#!/bin/bash

# Function to recursively rename directories and subdirectories
rename_directories_subdirectories() {
  local dir="$1"
  find "$dir" -depth -type d -name '*Stack*' | while read -r path; do
    newpath=$(echo "$path" | sed 's/Stack//g')
    mv -v "$path" "$newpath"
  done
}

# Main script
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Error: Directory '$directory' does not exist!"
  exit 1
fi

# Call the function to recursively rename directories and subdirectories
rename_directories_subdirectories "$directory"

echo "Done!"

