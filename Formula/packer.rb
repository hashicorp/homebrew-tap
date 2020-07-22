class Packer < Formula
    desc "Packer"
    homepage "https://www.packer.io/"
    version "1.6.0"
    bottle :unneeded


    url "https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_darwin_amd64.zip"
    sha256 "118b32c3caa07fa8f824e6b9c89f2a7a94c3f3dbde73d79cd75c6f72662a0230"

    conflicts_with "packer"

    def install
      bin.install "packer"
    end

    test do
      system "#{bin}/packer --version"
    end

  end
