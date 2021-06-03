cask "hashicorp-boundary-desktop" do
  version "1.0.1"
  sha256 "6bac4b7d28b563ef80966b070fc4ecc610a38c05a30202307c00cf26355ae600"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
