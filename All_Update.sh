#!/bin/bash

# Set the download directory
download_dir="/users/desktop/monthly"

# Set the list of AutoPkg recipes to run
recipes=(
    "com.github.rtrouton.pkg.googlechromeuniversal"
    "com.github.autopkg.pkg.AdobeReader"
    "com.github.novaksam.pkg.AdobeAcrobatDCUpdate"
    "com.github.autopkg.grahampugh-recipes.jamf.Firefox-pkg-upload"
    "com.github.rtrouton.jamf.citrixworkspaceuniversal"
    "com.github.dataJAR-recipes.download.boxdrive"
    "com.github.grahampugh.recipes.jamf.MicrosoftEdge"
    "com.github.rtrouton.pkg.AdobeCreativeCloudInstallerUniversal"
    "com.github.sryley.download.Webex"
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