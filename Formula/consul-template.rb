class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.29.0/consul-template_0.29.0_darwin_amd64.zip"
    sha256 "c7110580be052789e8955061de56bf616bdba612ad9ca400fca450912f08fd9d"
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
    url "https://releases.hashicorp.com/consul-template/0.29.0/consul-template_0.29.0_linux_amd64.zip"
    sha256 "9178437bde1f0f220010f17806c01b36ccb3814f065d4ebdfba53ade9832012d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.0/consul-template_0.29.0_linux_arm.zip"
    sha256 "f46755c708950baf57ff76203f302344bdcac97c7ebb13ed01fab1a753fca45e"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
