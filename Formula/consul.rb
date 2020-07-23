class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.8.0"
  bottle :unneeded

  url "https://releases.hashicorp.com/consul/1.8.0/consul_1.8.0_darwin_amd64.zip"
  sha256 "e75e51115e864ab622cbc1873c169be642bcaf35c3b4af257243cbabb9b52753"
  
  conflicts_with "consul"
  
  def install
    bin.install "consul"
  end
  
  test do
    system "#{bin}/consul --version"
  end

end
