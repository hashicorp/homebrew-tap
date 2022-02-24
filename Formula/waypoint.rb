class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.7.2/waypoint_0.7.2_darwin_amd64.zip"
    sha256 "82bfa16af8fc8d6820a318d0401b8561386e6c43e240428421821e96498126a8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.7.2/waypoint_0.7.2_darwin_arm64.zip"
    sha256 "fb155c39fc9e1e966566b5ce1cc90e19992ce352469fefb40e7e17c998811b30"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.7.2/waypoint_0.7.2_linux_amd64.zip"
    sha256 "f261bf03f98847271d743b618398010e14a9c396866b49f16425cf6fd6d0a5ab"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.7.2/waypoint_0.7.2_linux_arm.zip"
    sha256 "854930ce5478a11e4b06fbf4c288974944b9ee8a3cdc79d461f3aad3d05854e2"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
