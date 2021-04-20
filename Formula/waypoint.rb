class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.3.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.3.1/waypoint_0.3.1_darwin_amd64.zip"
    sha256 "e68492a84fd0b32d2d6bef69cb91682cde57a4988090e30aaf2bd8624aff8333"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.3.1/waypoint_0.3.1_darwin_arm64.zip"
    sha256 "371048f96cebb66419197c203b4e72905fb2e7f8303a76704e4329121da25768"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.3.1/waypoint_0.3.1_linux_amd64.zip"
    sha256 "caaad459343295a6f3b9354ff1ddca3b5e7e747506a33b82f84f3f14fc8d6ed4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.3.1/waypoint_0.3.1_linux_arm.zip"
    sha256 "ddece0143e5bde8b13a24ea00373953bb4fec30f02ae2b02921e6bf05d2b521f"
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
