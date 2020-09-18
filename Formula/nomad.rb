class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"

  url "https://releases.hashicorp.com/nomad/0.12.5/nomad_0.12.5_darwin_amd64.zip"
  version "0.12.5"
  sha256 "ebcbdccf73fa10f90ac780723ddccb4b0817807fa6d5839091c41f26d43dd220"
  bottle :unneeded

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
