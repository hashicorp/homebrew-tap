class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.8.0/waypoint_0.8.0_darwin_amd64.zip"
    sha256 "cdf29a686cb317fdbc31945ac75db413959382a728ab0bfe78e2388fc3050245"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.8.0/waypoint_0.8.0_darwin_arm64.zip"
    sha256 "33a268df4b4ca70c4b7d0bcb88fdfc2bfee0c1a74b6fabd450d74a1dd24c13f6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.8.0/waypoint_0.8.0_linux_amd64.zip"
    sha256 "cda7bb55fdc422849429c65b58fbab3f1f8318b6ef8beecd0f0242fa07fcefcc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.8.0/waypoint_0.8.0_linux_arm.zip"
    sha256 "029d79071abb6f8d2f3ca80308314e8bbd33e24cc5bb9c90193cbcadbf6c700d"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
