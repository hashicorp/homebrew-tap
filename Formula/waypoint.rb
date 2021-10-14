class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.0/waypoint_0.6.0_darwin_amd64.zip"
    sha256 "d5904d3d3cf03bd09d57e5411bbe7ff709ccdb88b5d33108a837edb5d037f589"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.6.0/waypoint_0.6.0_darwin_arm64.zip"
    sha256 "1fb59dc27a433ce67d25ab3d0944e737d854b3ffafa671ed607abf3e21136056"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.0/waypoint_0.6.0_linux_amd64.zip"
    sha256 "1b67f1bf67616f0b323223c87e260cbc3612a82a5a3d362edc7d159ca0a94da7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.6.0/waypoint_0.6.0_linux_arm.zip"
    sha256 "729e70ac41356d02ed822edaa75d7d341194aca1dc89b774efa967386f52f7b8"
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
