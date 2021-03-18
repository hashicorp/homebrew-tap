class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.2.4/waypoint_0.2.4_darwin_amd64.zip"

  version "0.2.4"
  sha256 "bda5d7427379d8679b7475a8c04ccf522ef2bbad6c20bc3bc3ecfe7a63a075c1"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
