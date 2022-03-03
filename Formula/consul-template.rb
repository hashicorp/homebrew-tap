class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.28.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.28.0/consul-template_0.28.0_darwin_amd64.zip"
    sha256 "60f33c4aa3877ee9d2c49146fdc4ae606cc5d8b4aa6f42088dc7fe972f1068a0"
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
    url "https://releases.hashicorp.com/consul-template/0.28.0/consul-template_0.28.0_linux_amd64.zip"
    sha256 "810c6ada4ac9362838f66cf2312dd53d8d51beed37d1c2fb7c3812e1515a9372"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.28.0/consul-template_0.28.0_linux_arm.zip"
    sha256 "c3a25e6cb524920baddf8cce16bf5f00090cd490f2dc5681ef25246cc76525a0"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
