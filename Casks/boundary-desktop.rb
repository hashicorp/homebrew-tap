cask "hashicorp-boundary-desktop" do
  version "1.2.1"
  sha256 "d29ceee4d9fbb40fac44c9ae70fb818d050e36a38c1d475ec0b27b8e111cb04c"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
