class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.6.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.3/waypoint_0.6.3_darwin_amd64.zip"
    sha256 "e48eb5bacbc0208e70d59eebc6ae7d010281afc90900c201378258afd887425a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.6.3/waypoint_0.6.3_darwin_arm64.zip"
    sha256 "41e9188e162782567df4e64c4e41fb81c89d851907b5d7f064d101602897598f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.3/waypoint_0.6.3_linux_amd64.zip"
    sha256 "cff51372fb30c32f159fd39f5986b353db86bcd301158ffd32218cb18aad11eb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.6.3/waypoint_0.6.3_linux_arm.zip"
    sha256 "decdfd1211393337ba9208ce0399ee6363ac4ee5326efa2a92fde60d0cb3f8c5"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
