class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.4/consul-template_0.29.4_darwin_amd64.zip"
    sha256 "6daa027962f7dd8076e75abef88354810991a488a364bf10dd2bed2e46dbb1a2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.29.4/consul-template_0.29.4_darwin_arm64.zip"
    sha256 "ea1998beff02039ecf6529cc45e1d624a0487478f4b22b7f5f6d93d803901542"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.4/consul-template_0.29.4_linux_amd64.zip"
    sha256 "7e27ad0a0642fe869097d5c516304889f51e5e52f53f5b5d8d2d0a601feef8d5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.4/consul-template_0.29.4_linux_arm.zip"
    sha256 "95a0c98427cf49fad46e0b036125116dd6dd0a8bba5b285d11dd378f871c4b04"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.4/consul-template_0.29.4_linux_arm64.zip"
    sha256 "0de39fd8dbd9c766bbdb298f54dfe9a9786cb0e59badd9c88279ff585e193792"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
