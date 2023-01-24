cask "hashicorp-boundary-desktop" do
  version "1.5.0"
  sha256 "e7662610c7d9da58686281d60bae9c4b8d59f7b43fe4b353eff8684a845bbad6"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg", 
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
