class Nomad < Formula
    desc "Nomad"
    homepage "https://github.com/hashicorp/nomad"
    version: "0.11.3"
    bottle: unneeded
    if OS.mac?
      url "https://releases.hashicorp.com/nomad/0.11.3/nomad_0.11.3_darwin_amd64.zip"
      sha256 "f839e98d0f1650815b0077b6ab66ed4de315aad45100789719ddc776e7f33976"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://releases.hashicorp.com/nomad/0.11.3/nomad_0.11.3_linux_amd64.zip"
        sha256 "f486da4f6d08e42eb2c17e95cf36cc7f9d9c0e7cc8ced06ce3fca7c3abd7db3d"
      end
    end
    conflicts_with "nomad"
    def install
      bin.install "nomad"
    end
    test do
      system "#{bin}/nomad --version"
    end
  end