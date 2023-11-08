# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "1.7.1"
  sha256 "1308d08a5ddb86da04af68f325200ebd33f724cd4c7ea3d609fcf1f0dce36a3e"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
