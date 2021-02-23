class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"

  url "https://releases.hashicorp.com/waypoint/0.2.3/waypoint_0.2.3_darwin_amd64.zip"

  version "0.2.3"
  sha256 "1a61ce508ed8d234ea32dae5a8a6fb97147db205921e76880fc3be1ee4762358"
  bottle :unneeded

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
