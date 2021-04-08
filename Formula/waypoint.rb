class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.3.0/waypoint_0.3.0_darwin_amd64.zip"
    sha256 "f8d245d1ef7cd3e6d4d8c03e3a8e863e6a8162648ef946a8834afb92d9651436"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.3.0/waypoint_0.3.0_darwin_arm64.zip"
    sha256 "471467a3d0414186c580265e5011ea9ba2e73be6363ea98c9d1615562f8b2b36"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.3.0/waypoint_0.3.0_linux_amd64.zip"
    sha256 "80fa965a4c9f0c7b4e8fffa255a1823ff8df350523b336433debb17d79ad8d6d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.3.0/waypoint_0.3.0_linux_arm.zip"
    sha256 "010f75266d99f164dc33c087aa71612d638f2ef15d389c6d1d854657dab30816"
  end

  bottle :unneeded

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
