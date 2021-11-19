cask "hashicorp-boundary-desktop" do
  version "1.4.0"
  sha256 "910a30457c6eb3f4c8a99d7f6c84b3412029f74dedce8141594454aa196d553a"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
