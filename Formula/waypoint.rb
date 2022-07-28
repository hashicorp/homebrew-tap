class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.9.1/waypoint_0.9.1_darwin_amd64.zip"
    sha256 "40d6470430ccdc9727b4eb2b4ebacfae09eefccb02381da7b7850880092050e0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.9.1/waypoint_0.9.1_darwin_arm64.zip"
    sha256 "d572923b43bab8c7bb1f430e07c1dc2a7715026fd093e1aba601f0c6dd9916f5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.9.1/waypoint_0.9.1_linux_amd64.zip"
    sha256 "dabc135c73a4eb9cf1378816ee6b93ec33f6ec849103bcd936c88e08da0e1bbb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.9.1/waypoint_0.9.1_linux_arm.zip"
    sha256 "9d757754ca19e7fcd8915e902c53774ba931227601799eebdce0b42cd849e827"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
