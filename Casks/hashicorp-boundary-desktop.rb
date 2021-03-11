cask "hashicorp-boundary-desktop" do
  version "1.0.0-beta"
  sha256 "af1e81661a2e059c65548985976fb33e5f4b4cb4509e7baec463abf09063132c"

  url "https://releases.hashicorp.com/boundary-desktop/#{version}/boundary-desktop_#{version}_darwin_amd64.dmg"
  name "Boundary Desktop"
  desc ""
  homepage "https://www.boundaryproject.io/"

  app "Boundary.app"
end
