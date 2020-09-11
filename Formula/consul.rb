class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"

  url "https://releases.hashicorp.com/consul/1.8.4/consul_1.8.4_darwin_amd64.zip"
  version "1.8.4"
  sha256 "4c7aa80eef33e5e82b69b430904df0ff6000eaf747157ae140dde3106ed82e0f"
  bottle :unneeded

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  test do
    system "#{bin}/consul --version"
  end
end
