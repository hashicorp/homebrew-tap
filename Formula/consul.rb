class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.7.4"
  bottle :unneeded
  if OS.mac?
    url "https://releases.hashicorp.com/consul/1.7.4/consul_1.7.4_darwin_amd64.zip"
    sha256 "ec089afe66c7c49237d6ec1beca02257f0fe861d0615b2f06c3243cc9fd4e142"
  end
  conflicts_with "consul"
  def install
    bin.install "consul"
  end
  test do
    system "#{bin}/consul --version"
  end
end
