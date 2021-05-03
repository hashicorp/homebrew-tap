cask "hashicorp-boundary-desktop" do
  version "1.0.0"
  sha256 "c84f443f5e19af494135bb5e9998f27d4b52c213ddf57545f0be9027010b411d"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
