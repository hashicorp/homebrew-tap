# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.6.3"

  on_macos do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "4b3882b94846806c34d569281b5a864a657af5ca1384cd8aae5721ee55396cae",
           intel: "f42423da63c7dc656aab2245e75aba94f8b420652d0660e2cf1902b82f3c283b"
    url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_#{arch}.dmg"

    app "Boundary.app"
  end

  name "Boundary Desktop"
  desc "Desktop client for Boundary"
  homepage "https://www.boundaryproject.io/"

  depends_on :macos
end
