class Nomad < Formula
    desc "Nomad"
    homepage "https://www.nomadproject.io/"
    version "0.12.0"
    bottle :unneeded


    url "https://releases.hashicorp.com/nomad/0.12.0/nomad_0.12.0_darwin_amd64.zip"
    sha256 "bac24a2835cee40ba9d81a7ee922909787141534f9e8b6513768bb8cf24ec6cc"

    conflicts_with "nomad"

    def install
      bin.install "nomad"
    end

    test do
      system "#{bin}/nomad --version"
    end
  end
