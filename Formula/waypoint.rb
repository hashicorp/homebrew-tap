class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.1.5/waypoint_0.1.5_darwin_amd64.zip"

  version "0.1.5"
  sha256 "52a7c1285c06faa03b7972b9dc77204012db35724eb522d01fcb29b8a54f498e"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
