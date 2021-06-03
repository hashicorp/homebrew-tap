class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.4.0/waypoint_0.4.0_darwin_amd64.zip"
    sha256 "e4eb68a77fb097fb16dd0a191048a5c77a1b51a9ca5235b5dd1199512d53583b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.4.0/waypoint_0.4.0_darwin_arm64.zip"
    sha256 "f04805c4a7ddf00ab9bfa99a9775fabf5a70b82edb5a5a6730bff2f6c3acd93f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.4.0/waypoint_0.4.0_linux_amd64.zip"
    sha256 "6414d51bf525d4f841a0aa895f322f3ef940e874e038538023c4fabb8173ce15"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.4.0/waypoint_0.4.0_linux_arm.zip"
    sha256 "b53091ad803b5361234f880ccdb4f263c08c2b1d89cadd9124c1baa8869082ed"
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
