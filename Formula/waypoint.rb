class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.1.1/waypoint_0.1.1_darwin_amd64.zip"

  version "0.1.1"
  sha256 "7d8c61da91794245ee46663ae608b4d3aeb5aa721822c3b6a6f0b09017cc33c5"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
