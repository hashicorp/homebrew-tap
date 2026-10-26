# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "2.7.0"

  on_macos do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "4515f57b60a40255d2deb91b03e908c4dd28626c8671b6aeaafc4ff9b295c659",
           intel: "8e09cfd211e89585eb3c8bc22e4f6deef50bdacda3806150174c9ac35e45f9dc"

    url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_#{arch}.dmg"

    app "Boundary.app"
  end

  name "Boundary Desktop"
  desc "Desktop client for Boundary"
  homepage "https://www.boundaryproject.io/"

  depends_on :macos
end
