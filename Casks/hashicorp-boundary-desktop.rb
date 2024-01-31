# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.0.0"
  sha256 "49656e489440dcf773658cfa51d1abcfbadff5aef32127f2844f4f16ac170ae6"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
