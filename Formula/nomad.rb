class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"

  url "https://releases.hashicorp.com/nomad/0.12.2/nomad_0.12.2_darwin_amd64.zip"
  version "0.12.2"
  sha256 "50907d2bbf000feee447277317812412196674e456494b73e0f81d5b9e864a72"
  bottle :unneeded

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
