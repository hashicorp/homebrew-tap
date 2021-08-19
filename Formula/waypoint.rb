class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.5.1/waypoint_0.5.1_darwin_amd64.zip"
    sha256 "9d3cd1365fe32872078c77461e0ee86daa9c3c8c28d28e8f9be1d44d811a9dae"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.5.1/waypoint_0.5.1_darwin_arm64.zip"
    sha256 "417ee505341e85177e76efdbaa95739e6110da56d3ac279da3724f8beb60be62"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.5.1/waypoint_0.5.1_linux_amd64.zip"
    sha256 "da710d48b29b033ba7d26268eac3f604bd88284ffe0355e9c3fb88ca59562124"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.5.1/waypoint_0.5.1_linux_arm.zip"
    sha256 "7e3d228b871d6d1037019b2f1be582d6881e54dcba428d8aac7c33986ab30835"
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
