class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"

  url "https://releases.hashicorp.com/nomad/0.12.3/nomad_0.12.3_darwin_amd64.zip"
  version "0.12.3"
  sha256 "53f9f0bb2ab5c6f219e140471ec0dfd0bd4b89f23ce5f407309cce1a66aa5219"
  bottle :unneeded

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
