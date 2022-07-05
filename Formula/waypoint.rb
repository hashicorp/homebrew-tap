class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.9.0/waypoint_0.9.0_darwin_amd64.zip"
    sha256 "badda41a7a0dbb17f1ee6a7b7914b135b8d17877c9a349e3e7afc7a539f90e82"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.9.0/waypoint_0.9.0_darwin_arm64.zip"
    sha256 "97d4daea240f93d7798551d641cfc93feb38fff1c4c36a37cd7be2e13da71079"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.9.0/waypoint_0.9.0_linux_amd64.zip"
    sha256 "bb5fcbbd4af22f3d2fabe85fa9f92007a6e808d5eb5c4226e60dbf7038db8d4d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.9.0/waypoint_0.9.0_linux_arm.zip"
    sha256 "1376cd3184c54ce89f986b0cf03ff55f6ee71ed40c9b981f1c3c769fcbe1f777"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
