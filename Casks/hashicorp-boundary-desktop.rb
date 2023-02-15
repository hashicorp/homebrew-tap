cask "hashicorp-boundary-desktop" do
  version "1.5.1"
  sha256 "ec76c0a20f46926d27af9847a8e1f5dade9cd346df398888c0cf404fe6de21c7"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg", 
      verified: "hashicorp.com/boundary-desktop/"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"

end
