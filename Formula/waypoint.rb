class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.7.1/waypoint_0.7.1_darwin_amd64.zip"
    sha256 "5a2ac14dcfad729c7961e5a218bee18890bae54c671e1682b26c5d344e1ac391"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.7.1/waypoint_0.7.1_darwin_arm64.zip"
    sha256 "f9c7d9ea43f8550efe0e486606aefe9595c624d62c73ac3ce334d7415b84f959"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.7.1/waypoint_0.7.1_linux_amd64.zip"
    sha256 "8db1d7ea881ebd6837dbdb76ddab3820d80a727f0e6bed9b8b290847ba862e54"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.7.1/waypoint_0.7.1_linux_arm.zip"
    sha256 "0408d82cdef5e29ff62397ccc53e5442234dfbda231c41b0d95739f11e2c7980"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
