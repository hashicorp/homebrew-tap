# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-boundary-desktop" do
  version "1.6.0"
  sha256 "b6b5b15dfb469b7fdab9216788f5931e96561104de1ff7f9e0d6fda54701be09"

  url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg",
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
