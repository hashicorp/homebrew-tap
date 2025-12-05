# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.4.0"
  sha256 "f3559241ee4ee2f08f07c91b663d4c97d8091fa677143c2c9ecf083160b8833d"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
