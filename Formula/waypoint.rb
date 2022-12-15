class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.10.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.5/waypoint_0.10.5_darwin_amd64.zip"
    sha256 "5d11bfbdbd373358cc30a0112508c7fbc65e70e2498eba6d8e38e6ef7994865a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.10.5/waypoint_0.10.5_darwin_arm64.zip"
    sha256 "dc84482ccb0faef54d8801652bb8b40cc28f4936807d66c394496a0faa2e17c0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.5/waypoint_0.10.5_linux_amd64.zip"
    sha256 "dbce2ea1ed85fc06ddd7f4157560719c40236e3c735bb87d6715d790e7691519"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.5/waypoint_0.10.5_linux_arm.zip"
    sha256 "778faeea74f6d959235cb3bdf56f9aeba965aa8bd461b1b454c47bb998d6b720"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.10.5/waypoint_0.10.5_linux_arm64.zip"
    sha256 "963b3c0e1b020d690fec46dbcf3b15fc0165330f66fb0b87ffe61ae66affb0b2"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
