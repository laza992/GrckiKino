#!/bin/sh

#  swiftgen.sh
#  GrckiKino
#
#  Created by Lazar Stojkovic on 28.11.20..
#  

if which $PODS_ROOT/SwiftGen/bin/swiftgen >/dev/null; then

$PODS_ROOT/SwiftGen/bin/swiftgen storyboards "$PROJECT_DIR/$PROJECT_NAME/Storyboards" -t scenes-swift4 --output "$PROJECT_DIR/$PROJECT_NAME/Util/Config/Swiftgen/Storyboards.swift"
$PODS_ROOT/SwiftGen/bin/swiftgen colors "$PROJECT_DIR/$PROJECT_NAME/Util/Colors.txt" -t swift4 --output "$PROJECT_DIR/$PROJECT_NAME/Util/Config/Swiftgen/Colors.swift"
$PODS_ROOT/SwiftGen/bin/swiftgen xcassets "$PROJECT_DIR/$PROJECT_NAME/Assets/Assets.xcassets" -t swift4 --output "$PROJECT_DIR/$PROJECT_NAME/Util/Config/Swiftgen/Images.swift"
$PODS_ROOT/SwiftGen/bin/swiftgen fonts "$PROJECT_DIR/$PRODUCT_NAME/Util/Fonts" -t swift4 --output "$PROJECT_DIR/$PRODUCT_NAME/Util/Config/Swiftgen/Fonts.swift"

else
echo "warning: SwiftGen not installed, download it from https://github.com/AliSoftware/SwiftGen"
fi
