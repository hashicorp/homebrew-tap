# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.4.0"
  sha256 arm: "d886fb8082733d9a87e7430403fe3eba00904e973c45cb8331062a985883b29a",
         intel: "f3559241ee4ee2f08f07c91b663d4c97d8091fa677143c2c9ecf083160b8833d"
  arch arm: "arm64", intel: "amd64"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_#{arch}.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
