class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.2.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.2.4/waypoint_0.2.4_darwin_amd64.zip"
    sha256 "bda5d7427379d8679b7475a8c04ccf522ef2bbad6c20bc3bc3ecfe7a63a075c1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.2.4/waypoint_0.2.4_darwin_arm64.zip"
    sha256 "713c73e67297fc31cfdaab26252ec4c3febef2a949353b2786af9cb21a372f9d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.2.4/waypoint_0.2.4_linux_amd64.zip"
    sha256 "114c34148ad714e2ac0332b9e10437cf8402c37f8d0ad13c90410497fc47fdc1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.2.4/waypoint_0.2.4_linux_arm.zip"
    sha256 "32024af1ee5088bb49a577cf9ce8fcdea83af07133cb8795c7c816847f0c0f82"
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
