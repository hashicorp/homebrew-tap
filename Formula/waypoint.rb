class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.1.0/waypoint_0.1.0_darwin_amd64.zip"

  version "0.1.0"
  sha256 "86be77f811024e966bb3f408ed343f3d5f65a0f19e10dad488911be558e0de67"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
