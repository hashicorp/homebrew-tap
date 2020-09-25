class ConsulEnt < Formula
  desc "ConsulEnt"
  homepage "https://www.consul.io"

  url "https://releases.hashicorp.com/consul/1.8.4+ent/consul_1.8.4+ent_darwin_amd64.zip"
  version "1.8.4+ent"
  sha256 "dc0f2467c49c25832795228156b04b4f72a58ab4bc292ae1f65711d2f74ac663"
  bottle :unneeded

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  test do
    system "#{bin}/consul --version"
  end
end
