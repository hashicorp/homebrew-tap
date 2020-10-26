class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.1.4/waypoint_0.1.4_darwin_amd64.zip"

  version "0.1.4"
  sha256 "888c6db6dd53090b1840f443c017336cae6bb9ae0e5786eea1aba563701f8a75"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
