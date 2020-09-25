class ConsulTemplate < Formula
  desc "ConsulTemplate"
  homepage "https://github.com/hashicorp/consul-template"

  url "https://releases.hashicorp.com/consul-template/0.25.1/consul-template_0.25.1_darwin_amd64.zip"
  version "0.25.1"
  sha256 "b157cb01c957f1f8d2d990565ce9d0fa6f32709ece1f9769b1e630f0e13c838b"
  bottle :unneeded

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
