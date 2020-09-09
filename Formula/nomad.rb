class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"

  url "https://releases.hashicorp.com/nomad/0.12.4/nomad_0.12.4_darwin_amd64.zip"
  version "0.12.4"
  sha256 "987b9b74ce2d01ab09cf670b7faddf8be5890c281de9caa2f58c0ef25558b024"
  bottle :unneeded

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
