class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.2"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.29.2/consul-template_0.29.2_darwin_amd64.zip"
    sha256 "cdfea794b7a36232af9fd55ebf50874cbccc85194c66bdf210c411e734642baf"
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
    url "https://releases.hashicorp.com/consul-template/0.29.2/consul-template_0.29.2_linux_amd64.zip"
    sha256 "88d57a227967da2f7c14f702245adcf30d80ec59354ed43c8778eb7296c9d4db"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.2/consul-template_0.29.2_linux_arm.zip"
    sha256 "0dc439d8fc1e3d3dd833cf26f280104a8c74ace88b78ce95a9829284703e3e97"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
