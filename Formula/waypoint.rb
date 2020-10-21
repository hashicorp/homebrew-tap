class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.1.2"
  bottle :unneeded

  if OS.mac?
    url "https://releases.hashicorp.com/waypoint/0.1.2/waypoint_0.1.2_darwin_amd64.zip"
    sha256 "99ab1d760e9f4afc97f52c0c3c5724c104b0027a85b1cf8174cabb4c77ce60d6"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://releases.hashicorp.com/waypoint/0.1.2/waypoint_0.1.2_linux_amd64.zip"
      sha256 "05c2be901fa0cc24e4bd40c96267f9af7d8b62fe75e0a2f1b5862179bbc81c11"
    else
      url "https://releases.hashicorp.com/waypoint/0.1.2/waypoint_0.1.2_linux_arm.zip"
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
