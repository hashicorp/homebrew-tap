# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.2.0"
  sha256 "045178acda3de932aef9fadbe304a37f1d0f7acb4598fe477af22e2ed9b7a0d9"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
