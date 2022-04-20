class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.0.1-techpreview2"

  if OS.mac?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview2/nomad-pack_0.0.1-techpreview2_darwin_amd64.zip"
    sha256 "1936424c4a3c659af6300d5a99443c16529d4f34dde9f37090974fc75318de61"
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
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview2/nomad-pack_0.0.1-techpreview2_linux_amd64.zip"
    sha256 "d4ad91494f8b8bff58a27181fc7a0b6fc9fd47967aba92e107b549c17bf1f4f2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview2/nomad-pack_0.0.1-techpreview2_linux_arm.zip"
    sha256 "d69a74a5ceae8c374e128ece90fd70bf85459e1a2e89b67d14a1ef67ee4c6601"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview2/nomad-pack_0.0.1-techpreview2_linux_arm64.zip"
    sha256 "bc55aa45f5267e98a5d6e78899a55c2a7ca151df43aa214382ec4044567f3b54"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
