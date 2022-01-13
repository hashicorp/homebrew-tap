class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.7.0/waypoint_0.7.0_darwin_amd64.zip"
    sha256 "3088099e984b6f2882d7b3e14cb67b06363012339e4b41f8614dde2ebdae32e3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.7.0/waypoint_0.7.0_darwin_arm64.zip"
    sha256 "c4f93431ac76a04413277396cecbe9608ec97580a23ca3d88f196dfc3ce998c5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.7.0/waypoint_0.7.0_linux_amd64.zip"
    sha256 "fa3aefd80c934fb24f047336a7221de2ccda522e0a1941cbad11a4ece906a869"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.7.0/waypoint_0.7.0_linux_arm.zip"
    sha256 "a0aa02c244903564983321fe6506e1424675c7bcd1a7ae6fdff2ddd7af49f4b9"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
