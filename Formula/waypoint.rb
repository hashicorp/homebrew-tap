class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.10.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.3/waypoint_0.10.3_darwin_amd64.zip"
    sha256 "91e00214923237c6d8d29734d49c66deabe27295193d17582f2a54e28ebd806d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.10.3/waypoint_0.10.3_darwin_arm64.zip"
    sha256 "3d7de189a04ebe6a6d5004086b343b0cfe94b8bcaac67490449bb350cb3e8a1c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.3/waypoint_0.10.3_linux_amd64.zip"
    sha256 "2a97de706246b3e06147af49fe2dd6226162d9f0a2f966931eee16ecbd6eec6f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.3/waypoint_0.10.3_linux_arm.zip"
    sha256 "a4ec27f28769147d001a1a835a3fba43c6709a2aaf1e54f771cc6c6536f469a7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.3/waypoint_0.10.3_linux_arm64.zip"
    sha256 "f3995e1a452b22f0a99e6a79732d8e3d8573f038e913838d29315f728bb0b2ba"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
