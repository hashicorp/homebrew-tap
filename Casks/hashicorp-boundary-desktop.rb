cask "hashicorp-boundary-desktop" do
  version "1.4.1"
  sha256 "5e72c872ecb6550d459153173693aebfba72d8eab76de09fd051032d98552580"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
