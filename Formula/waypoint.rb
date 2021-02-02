class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.2.1/waypoint_0.2.1_darwin_amd64.zip"

  version "0.2.1"
  sha256 "75a0571a6770d8b8e03d8d1294f777f1c54a396a2940b62f89ecd8c66d32cdf3"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
