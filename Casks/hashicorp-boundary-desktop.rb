cask "hashicorp-boundary-desktop" do
  version "1.3.0"
  sha256 "d1d2ec3e10506ab0b4593caa6e813053477ac35eb44480bc2eea7d7e3e89518b"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
