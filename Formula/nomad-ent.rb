class NomadEnt < Formula
  desc "NomadEnt"
  homepage "https://www.nomadproject.io/"

  url "https://releases.hashicorp.com/nomad/0.12.5+ent/nomad_0.12.5+ent_darwin_amd64.zip"
  version "0.12.5+ent"
  sha256 "85c8404f5b5fa653c43237dd132f67a0cc9aa48a6c5f3a78ff0cb798cc84f24e"
  bottle :unneeded

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
