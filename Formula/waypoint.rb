class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_darwin_amd64.zip"
    sha256 "871b55002395e97ecb11cb7ceac0f3c89bba5bab5588562f4d7c332f1fba56c0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_darwin_arm64.zip"
    sha256 "1a2a2739c34c6b60a05f94aeb1ff025514b7344044970807313ad7e815e1ef83"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_linux_amd64.zip"
    sha256 "83df70b96b1d25d32ccc060c462c15d602b42f13e6972e16505dc05b8b360c47"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_linux_arm.zip"
    sha256 "1b60fe4541eefae7b78dced4be8585ad94038423711666547df8175ac91a74bb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.0/waypoint_0.11.0_linux_arm64.zip"
    sha256 "bb9bc9f9a8e0d3497f810c4430eecc03cbf625fc115bd43f3b9c22c870047936"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
