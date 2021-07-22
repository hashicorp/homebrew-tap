class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.4.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.4.2/waypoint_0.4.2_darwin_amd64.zip"
    sha256 "3f608335c94b932d61cdb2f8371d771174a6022badd0c6f8e5c7d3d9f05bc2be"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.4.2/waypoint_0.4.2_darwin_arm64.zip"
    sha256 "7b3076e8914ab439153edfc140e22d949d62aca4ef3285e669aea530a4a2396d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.4.2/waypoint_0.4.2_linux_amd64.zip"
    sha256 "0425393e559ea62fe5c256640bd5c6fbe121c283b0860019dec0fbb4f5689879"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.4.2/waypoint_0.4.2_linux_arm.zip"
    sha256 "5dac2389f728dddd69c392052547b9c1fae9b146facc1cecfd1011c59dcb41d7"
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
