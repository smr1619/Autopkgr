#!/bin/bash

# Set the list of AutoPkg recipes to run
recipes=(
    "com.github.data-JAR-recipes.pkg.Rectangle"
    "com.github.beatlemike.jamf.AdobeCCDesktop"
    "com.github.beatlemike.jamf.AdobeAcrobatDCUpdate"
    "com.github.beatlemike.jamf.AdobeAcrobatReaderDCUpdate"
    "com.github.autopkg.pkg.googlechrome"
    "com.github.rtrouton.pkg.microsoftedge"
    "com.github.rtrouton.pkg.Firefox"
    "com.github.homebysix.pkg.Zoom"
)

# Check if AutoPkg is installed
if ! command -v autopkg &> /dev/null; then
    echo "AutoPkg not found. Please install AutoPkg."
    exit 1
fi

# Run each AutoPkg recipe to download the packages to the download directory
for recipe in "${recipes[@]}"; do
    autopkg run "$recipe" --post "io.github.hjuutilainen.VirusTotalAnalyzer/VirusTotalAnalyzer"
done
