class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.1.2/waypoint_0.1.2_darwin_amd64.zip"

  version "0.1.2"
  sha256 "a551ae005477e0f04c5ca6a2da45d1519b8659ac65ee0cc04dfac6b5413b3d7a"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
