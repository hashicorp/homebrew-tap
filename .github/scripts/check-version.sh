#!/bin/bash

# Version checking script for Homebrew tap updates
# Usage: check-version.sh <product_name> <incoming_version> <is_cask>
# 
# Modes:
# - Cask mode: is_cask="true" (checks ./Casks/<product_name>.rb)
# - Formula mode: is_cask="false" (checks ./Formula/<product_name>.rb)
# - Both mode: NOT SUPPORTED - script only handles one file at a time
#   For both mode, call this script twice with different is_cask values
#
# Outputs: should_update (true/false), current_version, incoming_version

set -euo pipefail

# Logging and error handling functions
log() { echo "$*" 1>&2 ; }

ERROR_COUNT=0
err() { log "[error] $*" ; ERROR_COUNT=$((ERROR_COUNT + 1)) ; }

die() { err "$*" ; exit 1 ; }

# extract_current_version is a filter that reads a cask or formula from stdin
# and emits the extracted version string (if any) on stdout.
extract_current_version() {
    grep -E '^\s*version\s+' | sed -E 's/.*"([^"]+)".*/\1/' | head -1 || true
}

# Function to compare semantic versions
# Returns: 0 if version1 < version2 (version2 is newer)
#          1 if version1 == version2 (equal)
#          2 if version1 > version2 (version1 is newer)
compare_versions() {
    local version1="$1"
    local version2="$2"
    
    if [[ "$version1" == "$version2" ]]; then
        return 1  # Equal
    fi
    
    # Use sort -V for semantic version comparison
    local sorted
    sorted=$(printf '%s\n%s\n' "$version1" "$version2" | sort --version-sort)
    local first_line
    first_line=$(echo "$sorted" | head -1)
    
    if [[ "$first_line" == "$version1" ]]; then
        return 0  # First is smaller (version2 is newer)
    else
        return 2  # First is larger (version2 is older)
    fi
}

# Determine the file path for a product
get_file_path() {
    local product_name="$1"
    local is_cask="$2"
    
    if [[ "$is_cask" == "true" ]]; then
        echo "./Casks/${product_name}.rb"
    else
        echo "./Formula/${product_name}.rb"
    fi
}

# Check if we should update based on version comparison
should_update_version() {
    local current_version="$1"
    local incoming_version="$2"
    
    if compare_versions "$current_version" "$incoming_version"; then
        echo "true"
        return 0
    elif [[ $? -eq 1 ]]; then
        echo "false"
        return 0
    else
        echo "false"
        return 0
    fi
}

# Main function that orchestrates the version checking
main() {
    # Handle version flag
    case "${1:-}" in
        -v|-version|--version)
            echo "check-version.sh v1.0.0"
            exit 0
            ;;
    esac
    
    # Check arguments
    if [[ $# -ne 3 ]]; then
        die "Usage: $0 <product_name> <incoming_version> <is_cask>"
    fi

    local product_name="$1"
    local incoming_version="$2"
    local is_cask="$3"
    
    # Get file path
    local file_path
    file_path=$(get_file_path "$product_name" "$is_cask")

    # Check if the file exists
    if [[ ! -f "$file_path" ]]; then
        log "File $file_path does not exist. This is a new product, proceeding with update."
        echo "should_update=true"
        echo "current_version="
        echo "incoming_version=$incoming_version"
        exit 0
    fi

    # Extract current version from the file
    local current_version
    current_version=$(extract_current_version < "$file_path")

    # Validate that we found a version
    if [[ -z "$current_version" ]]; then
        die "Could not extract current version from $file_path"
    fi

    log "Current version: $current_version"
    log "Incoming version: $incoming_version"

    # Determine if we should update
    local should_update
    should_update=$(should_update_version "$current_version" "$incoming_version")

    # Output appropriate message and result
    if [[ "$should_update" == "true" ]]; then
        log "Incoming version $incoming_version is newer than current version $current_version. Proceeding with update."
    else
        if compare_versions "$current_version" "$incoming_version"; then
            # This shouldn't happen since should_update would be true
            log "Incoming version $incoming_version is newer than current version $current_version. Proceeding with update."
        elif [[ $? -eq 1 ]]; then
            log "Incoming version $incoming_version is the same as current version $current_version. Skipping update."
        else
            log "Incoming version $incoming_version is older than current version $current_version. Skipping update."
        fi
    fi

    # Output the results
    echo "should_update=$should_update"
    echo "current_version=$current_version"
    echo "incoming_version=$incoming_version"
}

# Only run main if this script is executed directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
