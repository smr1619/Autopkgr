<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Comment</key>
	<string>Created with Recipe Robot v2.2.0 (https://github.com/homebysix/recipe-robot)</string>
	<key>Description</key>
	<string>Downloads the latest version of Webex and creates a package.</string>
	<key>Identifier</key>
	<string>com.github.sryley.pkg.Webex</string>
	<key>Input</key>
	<dict>
		<key>NAME</key>
		<string>Webex</string>
	</dict>
	<key>MinimumVersion</key>
	<string>1.0.0</string>
	<key>ParentRecipe</key>
	<string>com.github.sryley.download.Webex</string>
	<key>Process</key>
	<array>
		<dict>
			<key>Processor</key>
			<string>AppPkgCreator</string>
		</dict>
	</array>
</dict>
</plist>
