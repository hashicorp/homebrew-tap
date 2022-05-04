cask "hashicorp-boundary-desktop" do
  version "1.4.3"
  sha256 "8a8ed01ef97179cc31cb4f33bf63f53155768b4f4beda65e9b9fd4bd7cf84905"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
