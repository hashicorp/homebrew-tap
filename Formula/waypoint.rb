class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.10.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.1/waypoint_0.10.1_darwin_amd64.zip"
    sha256 "71e2db9babe90e70947bd43de5075eaf2bef5a89d06ffdb94e6300db00dceacc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.10.1/waypoint_0.10.1_darwin_arm64.zip"
    sha256 "b077c2d8dd7943f63da3d9e9204a0075542f24084df1b5d44d14c628a2eb4b06"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.1/waypoint_0.10.1_linux_amd64.zip"
    sha256 "2366796f6f76a3491f99818245419c5e48fc4fc4352d0499599f10db97502698"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.1/waypoint_0.10.1_linux_arm.zip"
    sha256 "8d47d87b93dfd5a62460f8e370ab4af90124334fe4b096a3ab2f126a680b7990"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
