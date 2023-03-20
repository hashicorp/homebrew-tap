class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_darwin_amd64.zip"
    sha256 "77d1d88e8ab8a808e70683daaff2d6c43de787e7c8da57d0adba72a21d891b7b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_darwin_arm64.zip"
    sha256 "e4ec1634870bad0b294d46a614ac962d500fade05e2eeaf0bc0be2069888524a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_linux_amd64.zip"
    sha256 "83df70b96b1d25d32ccc060c462c15d602b42f13e6972e16505dc05b8b360c47"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_linux_arm.zip"
    sha256 "1b60fe4541eefae7b78dced4be8585ad94038423711666547df8175ac91a74bb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_linux_arm64.zip"
    sha256 "bb9bc9f9a8e0d3497f810c4430eecc03cbf625fc115bd43f3b9c22c870047936"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
