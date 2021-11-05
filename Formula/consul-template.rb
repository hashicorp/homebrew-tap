class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.27.2"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.27.2/consul-template_0.27.2_darwin_amd64.zip"
    sha256 "83585777ab1bdd23e4c717b181413764dd0707a7de0e6d9494f0b285cf22f9ba"
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
    url "https://releases.hashicorp.com/consul-template/0.27.2/consul-template_0.27.2_linux_amd64.zip"
    sha256 "d3d428ede8cb6e486d74b74deb9a7cdba6a6de293f3311f178cc147f1d1837e8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.27.2/consul-template_0.27.2_linux_arm.zip"
    sha256 "b453170ba4c35176bfab3bba6b81f7d9ca58425b1bb9bdf342428240d1af59ac"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
