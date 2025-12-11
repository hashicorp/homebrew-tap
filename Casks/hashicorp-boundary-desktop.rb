# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.5.0"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "5aead407bc3fcb931d610ce181b4231cd19f6f812c6142a1b05fb0a6706888c7",
         intel: "def99bc55bc2f5be86543a40a53323ba05363342eb15fbdd08f191552d3d7515"
  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_#{arch}.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
