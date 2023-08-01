#!/bin/bash

# Set the download directory
download_dir="/users/desktop/Autopkg_Files"

# Set the list of AutoPkg recipes to run
recipes=(
    "com.github.smr1619.Rectangle.sr.jamf.recipe"
    "com.github.smr1619.AdobeCC.sr.jamf.recipe"
    "com.github.smr1619.AdobeAcrobat.sr.jamf.recipe"
    "com.github.smr1619.AdobeReader.sr.jamf.recipe"
    "com.github.smr1619.Chrome.sr.jamf.recipe"
    "com.github.smr1619.Edge.sr.jamf.recipe"
    "com.github.smr1619.firefox.sr.jamf.recipe"
    "com.github.smr1619.zoom.sr.jamf.recipe"
)

# Check if AutoPkg is installed
if ! command -v autopkg &> /dev/null; then
    echo "AutoPkg not found. Please install AutoPkg."
    exit 1
fi

# Update the trust information for all recipes in AutoPkg
autopkg update-trust-info

# Run each AutoPkg recipe to download the packages to the download directory
for recipe in "${recipes[@]}"; do
    autopkg run "$recipe" --post "io.github.hjuutilainen.VirusTotalAnalyzer/VirusTotalAnalyzer"
done

# Move the downloaded packages to the download directory
mv /Library/AutoPkg/Cache/*/*.pkg "$download_dir"
