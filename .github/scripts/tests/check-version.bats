#!/usr/bin/env bats

# BATS tests for check-version.sh script
# To run: bats .github/scripts/tests/check-version.bats

# Setup and teardown functions
setup() {
    # Get the directory of this test file
    TEST_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" && pwd)"
    SCRIPT_DIR="$(cd "$TEST_DIR/.." && pwd)"
    
    # Set up temporary directories for testing
    TEMP_DIR="$(mktemp -d)"
    export TEMP_DIR
    export SCRIPT_PATH="$SCRIPT_DIR/check-version.sh"
    
    # Create temporary Formula and Casks directories
    mkdir -p "$TEMP_DIR/Formula"
    mkdir -p "$TEMP_DIR/Casks"
    
    # Change to temp directory for testing
    cd "$TEMP_DIR" || exit 1
    
    # Copy test data
    cp "$TEST_DIR/data/test-formula.rb" "$TEMP_DIR/Formula/"
    cp "$TEST_DIR/data/test-cask.rb" "$TEMP_DIR/Casks/"
    cp "$TEST_DIR/data/old-version.rb" "$TEMP_DIR/Formula/"
}

teardown() {
    # Clean up temporary directory
    rm -rf "$TEMP_DIR"
}

# Helper function to run the script and capture output
run_check_version() {
    case $# in
        0) run "$SCRIPT_PATH" ;;
        1) run "$SCRIPT_PATH" "$1" ;;
        2) run "$SCRIPT_PATH" "$1" "$2" ;;
        *) run "$SCRIPT_PATH" "$1" "$2" "$3" ;;
    esac
}

# Helper function to parse script output
parse_output() {
    local output="$1"
    echo "$output" | grep "should_update=" | cut -d'=' -f2
}

get_output_value() {
    local output="$1"
    local key="$2"
    echo "$output" | grep "^${key}=" | cut -d'=' -f2
}

# Version comparison tests
@test "newer version should update (major version bump)" {
    run_check_version "test-formula" "2.0.0" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "true" ]
}

@test "newer version should update (minor version bump)" {
    run_check_version "test-formula" "1.3.0" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "true" ]
}

@test "newer version should update (patch version bump)" {
    run_check_version "test-formula" "1.2.4" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "true" ]
}

@test "same version should not update" {
    run_check_version "test-formula" "1.2.3" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "false" ]
}

@test "older version should not update (major)" {
    run_check_version "test-formula" "0.9.0" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "false" ]
}

@test "older version should not update (minor)" {
    run_check_version "test-formula" "1.1.9" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "false" ]
}

@test "older version should not update (patch)" {
    run_check_version "test-formula" "1.2.2" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "false" ]
}

# Cask testing
@test "cask version comparison works (newer)" {
    run_check_version "test-cask" "2.2.0" "true"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "true" ]
}


@test "cask version comparison works (older)" {
    run_check_version "test-cask" "2.0.9" "true"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "false" ]
}

# New product testing
@test "new formula should update" {
    run_check_version "nonexistent-product" "1.0.0" "false"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "true" ]
    current_version=$(get_output_value "$output" "current_version")
    [ "$current_version" = "" ]
}

@test "new cask should update" {
    run_check_version "nonexistent-cask" "1.0.0" "true"
    [ "$status" -eq 0 ]
    should_update=$(get_output_value "$output" "should_update")
    [ "$should_update" = "true" ]
}
