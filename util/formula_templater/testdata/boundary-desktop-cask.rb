# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "1.6.0"

  on_macos do
    sha256 "b6b5b15dfb469b7fdab9216788f5931e96561104de1ff7f9e0d6fda54701be09"

    url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg",
        verified: "hashicorp.com/boundary-desktop/"

    app "Boundary.app"
  end

  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

end
