class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.27.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.27.0/consul-template_0.27.0_darwin_amd64.zip"
    sha256 "b015cb821c6e261248bef36fa9b00fab356ffa7365c566dcaa9a8fd8e6e42a1e"
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
    url "https://releases.hashicorp.com/consul-template/0.27.0/consul-template_0.27.0_linux_amd64.zip"
    sha256 "0d319977885e0f44562cc5f78e225d8431499cc3a95cd1b3fe560df8556bf64a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.27.0/consul-template_0.27.0_linux_arm.zip"
    sha256 ""
  end

  bottle :unneeded

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
