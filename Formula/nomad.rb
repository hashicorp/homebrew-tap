class Nomad < Formula
    desc "Nomad"
    homepage "https://www.nomadproject.io/"
    version "0.11.3"
    bottle :unneeded
    if OS.mac?
      url "https://releases.hashicorp.com/nomad/0.11.3/nomad_0.11.3_darwin_amd64.zip"
      sha256 "5c4087d6e79e1465bd9464d17d196b489abfb0c3c1290fc56ab88843d92a08da"
    end
    conflicts_with "nomad"
    def install
      bin.install "nomad"
    end
    test do
      system "#{bin}/nomad --version"
    end
  end
