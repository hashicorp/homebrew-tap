#!/bin/bash

# Version checking script for Homebrew tap updates
# Usage: check-version.sh <product_name> <incoming_version> <is_cask>
# Outputs: should_update (true/false), current_version, incoming_version

set -euo pipefail

# Check arguments
if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <product_name> <incoming_version> <is_cask>" >&2
    exit 1
fi

PRODUCT_NAME="$1"
INCOMING_VERSION="$2"
IS_CASK="$3"

# Determine file path based on whether it's a cask or formula
if [[ "$IS_CASK" == "true" ]]; then
    FILE_PATH="./Casks/hashi-${PRODUCT_NAME}.rb"
else
    FILE_PATH="./Formula/${PRODUCT_NAME}.rb"
fi

# Check if the file exists
if [[ ! -f "$FILE_PATH" ]]; then
    echo "File $FILE_PATH does not exist. This is a new product, proceeding with update." >&2
    echo "should_update=true"
    echo "current_version="
    echo "incoming_version=$INCOMING_VERSION"
    exit 0
fi

# Extract current version from the file
# Both formulas and casks use the same version format: version "x.y.z"
CURRENT_VERSION=$(grep -E '^\s*version\s+' "$FILE_PATH" | sed -E 's/.*"([^"]+)".*/\1/' | head -1 || true)

# Validate that we found a version
if [[ -z "$CURRENT_VERSION" ]]; then
    echo "Error: Could not extract current version from $FILE_PATH" >&2
    exit 1
fi

echo "Current version: $CURRENT_VERSION" >&2
echo "Incoming version: $INCOMING_VERSION" >&2

# Function to compare semantic versions
compare_versions() {
    local version1="$1"
    local version2="$2"
    
    if [[ "$version1" == "$version2" ]]; then
        return 1  # Equal
    fi
    
    # Use sort -V for semantic version comparison
    local sorted
    sorted=$(printf '%s\n%s\n' "$version1" "$version2" | sort -V)
    local first_line
    first_line=$(echo "$sorted" | head -1)
    
    if [[ "$first_line" == "$version1" ]]; then
        return 0  # First is smaller (version2 is newer)
    else
        return 2  # First is larger (version2 is older)
    fi
}

# Compare versions and set outputs
if compare_versions "$CURRENT_VERSION" "$INCOMING_VERSION"; then
    echo "Incoming version $INCOMING_VERSION is newer than current version $CURRENT_VERSION. Proceeding with update." >&2
    echo "should_update=true"
elif [[ $? -eq 1 ]]; then
    echo "Incoming version $INCOMING_VERSION is the same as current version $CURRENT_VERSION. Skipping update." >&2
    echo "should_update=false"
else
    echo "Incoming version $INCOMING_VERSION is older than current version $CURRENT_VERSION. Skipping update." >&2
    echo "should_update=false"
fi

echo "current_version=$CURRENT_VERSION"
echo "incoming_version=$INCOMING_VERSION"
