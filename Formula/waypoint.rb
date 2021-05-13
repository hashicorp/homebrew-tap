class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.3.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.3.2/waypoint_0.3.2_darwin_amd64.zip"
    sha256 "acbab89718cd118b571d1d46abbc56870dc2e654e21a16a90a9d4353649997e5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.3.2/waypoint_0.3.2_darwin_arm64.zip"
    sha256 "eaf4caeabc863ff58cbf39e7a58a18a50e74c9e9b1068fc705aca12c04abe2a0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.3.2/waypoint_0.3.2_linux_amd64.zip"
    sha256 "0df77efcab7e9a2153b916e4d13b92cd89d09429a483c0e1bae7b31bc13370ee"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.3.2/waypoint_0.3.2_linux_arm.zip"
    sha256 "8304f2657c5cfee40d49a27bb9307601825e37fbffa771fb705067f08cb685a9"
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
