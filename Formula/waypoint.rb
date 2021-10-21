class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.1/waypoint_0.6.1_darwin_amd64.zip"
    sha256 "d96c4009ae809cbf14f62e5f9419a2fd37024b806ebcde833f2c25f12fb7fc6e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.6.1/waypoint_0.6.1_darwin_arm64.zip"
    sha256 "e9e3ba47f86b18df9d3331700377c4ae151a62d766d7d37054195540dee27946"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.6.1/waypoint_0.6.1_linux_amd64.zip"
    sha256 "a6194624254a94147c468e0e99aeebb616a4820a593f2a8707704d9c467cba80"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.6.1/waypoint_0.6.1_linux_arm.zip"
    sha256 "75aeb9d63163105d8a215b06a1e6bb1fd8dad6a9ce8d5a80fa0d3a881868fe7f"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
