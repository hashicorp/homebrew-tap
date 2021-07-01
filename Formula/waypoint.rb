class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.4.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.4.1/waypoint_0.4.1_darwin_amd64.zip"
    sha256 "ebb8b6d241e6556018d985402c150cbe6cc271c9e1dcd7d3a147764103053e5a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.4.1/waypoint_0.4.1_darwin_arm64.zip"
    sha256 "ecb7d220ae30a49d1c48956b8391a6582f28aa4be9d4fc755c62d80878c23ad0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.4.1/waypoint_0.4.1_linux_amd64.zip"
    sha256 "3fba8cd3326584333b810be0b41eb9bb01833350c4e513417a3b22e5fd0a393a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.4.1/waypoint_0.4.1_linux_arm.zip"
    sha256 "0de1969f46d48eb8721e48390e419e323e163a9102e1b4bcbcdb372abc688f24"
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
