cask "hashicorp-boundary-desktop" do
  version "1.4.4"
  sha256 "2980a6b6030e3dbd856457a1a72324e813533ced4b8d54d085e189b5a0ba0e0f"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
