class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.1.3/waypoint_0.1.3_darwin_amd64.zip"

  version "0.1.3"
  sha256 "99ab1d760e9f4afc97f52c0c3c5724c104b0027a85b1cf8174cabb4c77ce60d6"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
