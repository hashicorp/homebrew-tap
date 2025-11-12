# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "test-cask" do
  version "2.1.0"
  sha256 "def456"

  url "https://releases.example.com/test-cask/#{version}/test-cask_#{version}_darwin_amd64.dmg"
  name "Test Cask"
  desc "Test Cask Description"
  homepage "https://test.example.com/"

  app "TestCask.app"
end
