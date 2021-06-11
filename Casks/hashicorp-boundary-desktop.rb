cask "hashicorp-boundary-desktop" do
  version "1.1.0"
  sha256 "a0f1ca2ab60c1ec106e1a4e067ea24ab75f6eb5e9fc9dc90a6680a8c37d1a29a"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
