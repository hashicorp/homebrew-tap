class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.0/waypoint_0.10.0_darwin_amd64.zip"
    sha256 "dff7403f4b1bd5ca8d25d6881971a0ef402fd2f1885266ca3c58a06083ce67e3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.10.0/waypoint_0.10.0_darwin_arm64.zip"
    sha256 "577c32da0f5afd9f016370151fa64f9cb5f85bdd0b456db2fbb77db0457a3478"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.0/waypoint_0.10.0_linux_amd64.zip"
    sha256 "f5afcb30f7a6aa7be9b71b0f318fcb9dc3a55acba032b6041a29ceaf3366e2d2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.0/waypoint_0.10.0_linux_arm.zip"
    sha256 "d30ae70ba04a5e7b338aeed4ddafb17771d424f3115e5e8e02b01f8b350d45ab"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
