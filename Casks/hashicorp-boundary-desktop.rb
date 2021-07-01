cask "hashicorp-boundary-desktop" do
  version "1.2.0"
  sha256 "bae63fe5ccc39e4a60a1f031a85d1d384d18ba174582b693ce95e7e89a7d406e"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
