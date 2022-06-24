class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.29.1/consul-template_0.29.1_darwin_amd64.zip"
    sha256 "953a05a507c48de2aa7556f7d1c1b94844c09a22f96dc2eb4af2f78512cda688"
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
    url "https://releases.hashicorp.com/consul-template/0.29.1/consul-template_0.29.1_linux_amd64.zip"
    sha256 "bd051cba75fc86bb1e27a741c69e3f39ea877e15f04e220f8e7e4f2f83127bc3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.1/consul-template_0.29.1_linux_arm.zip"
    sha256 "8e85518a104443fa9179f1c2bcf6fb4f342c09312ec685b745cfc34b3c172c28"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
