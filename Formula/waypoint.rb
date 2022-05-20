class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.8.2/waypoint_0.8.2_darwin_amd64.zip"
    sha256 "95270fca0a4fbd7e95022b9066bf5517b6e7ead53cdd499c352ff2ad5b7ac1be"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.8.2/waypoint_0.8.2_darwin_arm64.zip"
    sha256 "fc4f345120145bf86a45af74c9b3453532902eb01af96c261ce9f74a1e48cf93"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.8.2/waypoint_0.8.2_linux_amd64.zip"
    sha256 "bc5ee76b94641b87b190073f31e74f822f0d290404c71659e6cd1aa69425ed6e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.8.2/waypoint_0.8.2_linux_arm.zip"
    sha256 "6f739b6dd0a0a504a36cda20312fa72f5433b488bd9e48fdb28702b60f1610c7"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
