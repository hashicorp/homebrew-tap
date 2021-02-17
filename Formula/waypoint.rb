class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.2.2/waypoint_0.2.2_darwin_amd64.zip"

  version "0.2.2"
  sha256 "58de7a19291dd5ada36d0984825658de1ea4c8ce58cc81f76f3ab902a7b6c5b0"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
