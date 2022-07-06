cask "hashicorp-boundary-desktop" do
  version "1.4.5"
  sha256 "92329c3841a53171f00feda0be7a261958f76881fd19b39400c894f0e9133ba1"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
