class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.8.1/waypoint_0.8.1_darwin_amd64.zip"
    sha256 "ff13d8823aea9c89921cef8b07a083dbf65f7576dc0eaffe5762a5f72fe9841f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.8.1/waypoint_0.8.1_darwin_arm64.zip"
    sha256 "898b0b8722299d1608ca8a9d7946940debc86356e6d16dcc48b9e707c1b4060d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.8.1/waypoint_0.8.1_linux_amd64.zip"
    sha256 "ec2ef7e11f3e1b9ba4a71cc23478f2d60445baddab92d05782d03a6a5e9a824e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.8.1/waypoint_0.8.1_linux_arm.zip"
    sha256 "4680aec963624283c65822db86e7ba541a70ba043ea1b665adfbfbb364a9ef03"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
