# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.3.3"
  sha256 "738bfdcad34004e3f550f38c8f5dced9c7454e1dbc567a52f5a9539c21c8cc28"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
