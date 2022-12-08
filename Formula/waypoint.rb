class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.10.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.4/waypoint_0.10.4_darwin_amd64.zip"
    sha256 "e360bd8d041c3da4f5f3ba647103fcd6ce1dac56412140a858c1ac2bd9156bb9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.10.4/waypoint_0.10.4_darwin_arm64.zip"
    sha256 "2a9a4c7df99a52a4a5abb7c81e62d08f7c74cc13180c575d3df960bc58747b53"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.4/waypoint_0.10.4_linux_amd64.zip"
    sha256 "9124871b37c1b9e46489fa6cf22e2ca64c7dbe9eb39f0eb0c30a1c1e49d46448"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.4/waypoint_0.10.4_linux_arm.zip"
    sha256 "cca355515f78b4d84468dc3b3d787ccb02cfff2e936101c585cce94055191307"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.4/waypoint_0.10.4_linux_arm64.zip"
    sha256 "09088af249e42f970d7fe6c951af8ff76e13cc4288710a8661848d36a3bad7cc"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
