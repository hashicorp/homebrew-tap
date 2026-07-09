# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "2.0.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.2/consul-dataplane_2.0.2_darwin_amd64.zip"
    sha256 "62a928074874f5ce0b395124d4721e116cfb6b3dd539d34d42d9a2dc9208e8aa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.2/consul-dataplane_2.0.2_darwin_arm64.zip"
    sha256 "81c10df8f6d05674ddf379026ecfcc772089a4ad391f517e94d53c344c3e6986"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.2/consul-dataplane_2.0.2_linux_amd64.zip"
    sha256 "11b89b959cf1cecaa766e69c00c3ecc6fc9f4e478addb9e7821f086c3858fc0a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.2/consul-dataplane_2.0.2_linux_arm.zip"
    sha256 "d544016638ab61ce0b8c0c1168c8cbf4d194bdee02fff6a330dd74ce4ad796da"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.2/consul-dataplane_2.0.2_linux_arm64.zip"
    sha256 "1ffddbef925b0f25d90a585133c556ca399a5135eb659ad4761871686239b5d7"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
