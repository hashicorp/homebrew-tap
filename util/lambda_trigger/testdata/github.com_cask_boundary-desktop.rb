# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "1.5.0"
  sha256 "861a1c0c11b70d8c1897e9cc78ce323b1e0df88217461255b92f09088c9bd15f"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
