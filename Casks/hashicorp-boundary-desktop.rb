# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.6.1"

  on_macos do
    arch arm: "arm64", intel: "amd64"
    sha256 arm: "636f4564d203f7d69de15c2655d167e4b7eef3455464ab14f4ba38f86e11edc2",
          intel: "8773effd0457b337b8adca85608442be29991f362099c9d915758b6b2e4a741a"
    url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_#{arch}.dmg",
        verified: "hashicorp.com/boundary-desktop/"

    app "Boundary.app"
  end

  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

end
