# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.6.2"

  on_macos do
    arch arm: "arm64", intel: "amd64"
    sha256 arm: "183ca42ce04b6cbf98661c54bc6bc79a1c8da401c0bcb2a4ef5b9b69bdfb119a",
           intel: "05640df4f9bb297c05f03be23f96a7d1f9c6a83e2cf4e9ca530bafee71e73880"
    url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_#{arch}.dmg",
        verified: "hashicorp.com/boundary-desktop/"

    app "Boundary.app"
  end

  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

end
