# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.6.0"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "a292b940f04cec8e7770de1c691cb91df0169dc57e5c161740956d7fb7768235",
         intel: "f5d236ef1c40784100485e4247de3d3ea325c6a2ebd664d7895cca2a469b7830"
  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_#{arch}.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
