class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.2.0/waypoint_0.2.0_darwin_amd64.zip"

  version "0.2.0"
  sha256 "f3db0bd82dee06a35cacd0318181bea002ec4abe6925b72d975ab3e999f63063"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
