class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.2/waypoint_0.6.2_darwin_amd64.zip"
    sha256 "559b220af693fe4cee3e66ff86b213109c273a7bb6bb5a856bf85b94f4f0ce9d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.6.2/waypoint_0.6.2_darwin_arm64.zip"
    sha256 "7ef3ba68caf3cfd84d50168d94dfaa158a7938fa16426110e0c9039db0d24f2e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.2/waypoint_0.6.2_linux_amd64.zip"
    sha256 "f8652c6ed09dbae6651ff63bc3cc87d748cc7ddd72c0929adcc6572cab132e21"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.6.2/waypoint_0.6.2_linux_arm.zip"
    sha256 "a85fef5e8e98dde5e492bf2ec5f8a32113f2131303278aa6c6e01c9777dd4aed"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
