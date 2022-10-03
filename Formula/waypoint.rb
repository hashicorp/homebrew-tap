class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.10.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.2/waypoint_0.10.2_darwin_amd64.zip"
    sha256 "05d279ef1e1e2dcd1a76c7c5242261298d935e9fb79919031bb4df8ab8ce3708"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.10.2/waypoint_0.10.2_darwin_arm64.zip"
    sha256 "80d9ae92621506b87ba69f5353ce6dc9176c4f4e6614be22bdd40ede49bc129b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.2/waypoint_0.10.2_linux_amd64.zip"
    sha256 "c04ff4aa2b620a6e2d5df307e95a72e85c80adb330e7852e33b6fa5f4adab143"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.2/waypoint_0.10.2_linux_arm.zip"
    sha256 "3bc17ade0a2fae0ef4c6c606a636c22d7d7e932e4138984ce5ca3358b70915ae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.2/waypoint_0.10.2_linux_arm64.zip"
    sha256 "d9e604f7502b76b56830d660b35ac684a471d3434571164b97b424f3a8c720d1"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
