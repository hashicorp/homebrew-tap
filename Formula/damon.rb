class Damon < Formula
    desc "damon"
    homepage "https://github.com/hashicorp/damon"
    version "0.1.0"

    if OS.mac?
      url "https://releases.hashicorp.com/damon/0.1.0/damon_0.1.0_darwin_amd64.zip"
      sha256 "TBD"
    end

    if OS.mac? && Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for this product
          at this time, however we do plan to support this in the future. The
          darwin_amd64 binary has been installed and may work in
          compatibility mode, but it is not fully supported.
        EOS
      end
    end

    if OS.linux? && Hardware::CPU.intel?
      url "https://releases.hashicorp.com/damon/0.1.0/damon_0.1.0_linux_amd64.zip"
      sha256 "TBD"
    end

    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/damon/0.1.0/damon_0.1.0_linux_arm.zip"
      sha256 "TBD"
    end

    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/damon/0.1.0/damon_0.1.0_linux_arm64.zip"
      sha256 "TBD"
    end

    conflicts_with "damon"

    def install
      bin.install "damon"
    end

    test do
      system "#{bin}/damon --version"
    end
  end
