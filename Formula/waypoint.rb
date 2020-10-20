class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.1.3"
  bottle :unneeded

  if OS.mac?
    url "https://releases.hashicorp.com/waypoint/0.1.3/waypoint_0.1.3_darwin_amd64.zip"
    sha256 "99ab1d760e9f4afc97f52c0c3c5724c104b0027a85b1cf8174cabb4c77ce60d6"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://releases.hashicorp.com/waypoint/0.1.3/waypoint_0.1.3_linux_amd64.zip"
      sha256 "bdf668eacd418ca412df9a93e9c243d790653eea75df608a242965ef79998633"
    else
      url "https://releases.hashicorp.com/waypoint/0.1.3/waypoint_0.1.3_linux_arm.zip"
      sha256 "5eeb40fb850c3932463cb56a8a61a0283a06b9cbd40d3a2f230670f7783bb54a"
    end
  end

  #conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint version"
  end
end
