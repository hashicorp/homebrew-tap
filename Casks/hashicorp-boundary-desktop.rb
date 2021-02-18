cask "hashicorp-boundary-desktop" do
  version "1.0.0-alpha"
  sha256 "7a5ecb05bb7056a8ed95e2f8ef9fb06fd1f200c568423d410ab0670204baad32"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary Desktop.app"
end
