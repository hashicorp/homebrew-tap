class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.5.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.5.2/waypoint_0.5.2_darwin_amd64.zip"
    sha256 "5d88461d0cab8faac7ba8d916c6f836de1e9af34388ea60f8b6ebdc998f27a3a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.5.2/waypoint_0.5.2_darwin_arm64.zip"
    sha256 "eb48423346faabebced97034323802c26cc29e36561967979b6116064f12de74"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.5.2/waypoint_0.5.2_linux_amd64.zip"
    sha256 "8e9f53d525e5f49e57f65c58ed8caea569b5fd0dcff44c380d103782d077d4d9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.5.2/waypoint_0.5.2_linux_arm.zip"
    sha256 "68528cc936d253500da4073b3320eee7313f6011bc726eeb7834be8f9db4abe8"
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
