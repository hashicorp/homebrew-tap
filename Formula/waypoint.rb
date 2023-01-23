class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.10.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.10.5/waypoint_0.10.5_darwin_amd64.zip"
    sha256 "30e2a1565446c3d99f762efb207e1a59c77dda9e08b0316888597ee8711c5db6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.10.5/waypoint_0.10.5_darwin_arm64.zip"
    sha256 "80d9f40d25851d3520ab3e0bbcc66e7b2566e7d2154a9122cb1077bd8142988e"
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
