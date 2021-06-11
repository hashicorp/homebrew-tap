class Envconsul < Formula
  desc "Envconsul"
  homepage "https://github.com/hashicorp/envconsul"

  url "https://releases.hashicorp.com/envconsul/0.10.0/envconsul_0.10.0_darwin_amd64.zip"
  version "0.10.0"
  sha256 "a5139fbc2a714a07536be4c847c4037dbe66d85b23d538e77510c2c64ccf1d7d"
  bottle :unneeded

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
