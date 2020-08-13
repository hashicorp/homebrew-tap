class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"

  url "https://releases.hashicorp.com/consul/1.8.3/consul_1.8.3_darwin_amd64.zip"
  version "1.8.3"
  sha256 "cd3c47042b8b766439c79e1e4bccc18cbeaa6e866e3b7eef647a321749452aff"
  bottle :unneeded

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  test do
    system "#{bin}/consul --version"
  end
end
