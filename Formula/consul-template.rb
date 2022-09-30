class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.3/consul-template_0.29.3_darwin_amd64.zip"
    sha256 "253bdc57b9c7fef6ba391e2181c972e1a6abcddb42c675fc2d7baa8e5287c1fe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.29.3/consul-template_0.29.3_darwin_arm64.zip"
    sha256 "5030eda175218f8d8bd9b5ba48fb527d3c019ab570cee83a756440020c530b0b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.3/consul-template_0.29.3_linux_amd64.zip"
    sha256 "cb6d2f2630ae3950129dff7ff39b1bd27de6e7a04817ecfb6163e00c45f93e0c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.3/consul-template_0.29.3_linux_arm.zip"
    sha256 "f4f40c723de8d873161856828f99e1701dc86d6f344a670941173d0d3b768655"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.3/consul-template_0.29.3_linux_arm64.zip"
    sha256 "dac0730e62338d29d76d799d3d955406ac93812476ca8e08c3cc28fcb724a0ce"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
