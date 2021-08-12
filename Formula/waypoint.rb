class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.5.0/waypoint_0.5.0_darwin_amd64.zip"
    sha256 "2f073e47f6782775f3e8924a9802e765a165ea7d3b39f76893e1c44d0a7ac9ca"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.5.0/waypoint_0.5.0_darwin_arm64.zip"
    sha256 "2725397d138f2b7c893e319e89bce8f60334b465a26860c3863d3c63ab58d426"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.5.0/waypoint_0.5.0_linux_amd64.zip"
    sha256 "2a5a353bd772be54466f0ab81361b383a2bc2d75266ca871197b54756e964ff5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.5.0/waypoint_0.5.0_linux_arm.zip"
    sha256 "8b08f50e335755c8dece3ea6e7388f3f772fbaf882084e224b9dd9513a873b30"
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
