class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.28.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.28.1/consul-template_0.28.1_darwin_amd64.zip"
    sha256 "2733f7933a18dbb99950944c12a8652c669d38f846e314fb7a71aaf866477ce5"
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
    url "https://releases.hashicorp.com/consul-template/0.28.1/consul-template_0.28.1_linux_amd64.zip"
    sha256 "3afe87115cf1b77196c7a4daab6429e495cd307c49deab255ff2adf2b3923541"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.28.1/consul-template_0.28.1_linux_arm.zip"
    sha256 "a29aae902d74f930f3a3b4837e0603d29a8991b57ed9f04b21a91cffc92dec22"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
