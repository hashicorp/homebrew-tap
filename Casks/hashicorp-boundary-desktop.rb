cask "hashicorp-boundary-desktop" do
  version "1.4.2"
  sha256 "1181cbd89de774937bc4cd1428e18bdebd8d3c1805e469c5bbc123df63b32122"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
