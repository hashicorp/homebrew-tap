class Hcdiag < Formula
    desc "Hcdiag"
    homepage "https://github.com/hashicorp/hcdiag"
    version "0.2.0"
  
    if OS.mac?
      url "https://releases.hashicorp.com/hcdiag/0.2.0/hcdiag_0.2.0_darwin_amd64.zip"
      sha256 "965201aec99ee640642e542c785ece105799833bee20606d8d102d68577a4271"
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
      url "https://releases.hashicorp.com/hcdiag/0.2.0/hcdiag_0.2.0_linux_amd64.zip"
      sha256 "6cae815fd1cecb212e5f7749a03b2ce1e4e5b79463f28b93e925312c15e2582f"
    end
  
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/hcdiag/0.2.0/hcdiag_0.2.0_linux_arm.zip"
      sha256 "74b33535c5d88ff70c5662682e42edeb1b7432181fed6ccdcb18075e755720e9"
    end
  
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/hcdiag/0.2.0/hcdiag_0.2.0_linux_arm64.zip"
      sha256 "a6ad75249569a0a638c71fbf861d61ab0bd5e306e05801a830211c0ea4507fbe"
    end
  
    conflicts_with "hcdiag"
  
    def install
      bin.install "hcdiag"
    end
  
    test do
      system "#{bin}/hcdiag --version"
    end
  end
