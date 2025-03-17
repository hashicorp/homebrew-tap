# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.6.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.3/consul-dataplane_1.6.3_darwin_amd64.zip"
    sha256 "1c1be89d9b0acfc28c9709145ee1158cdafc1921c21569b1804db967fdc6b471"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.3/consul-dataplane_1.6.3_darwin_arm64.zip"
    sha256 "21d47f11f2fee00c84b77418418de5a3856c3b5eb1d6906503129e961cb4e3e0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.3/consul-dataplane_1.6.3_linux_amd64.zip"
    sha256 "faf132a4d932a8e55e5c329d2eba4111bd95e42e17ed908ec2a5227d2e3eb7f1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.3/consul-dataplane_1.6.3_linux_arm.zip"
    sha256 "c661217a1bb32041cb65e5ec0214f8e7e3ac543adc923a16c785422d3bdf1a0e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.3/consul-dataplane_1.6.3_linux_arm64.zip"
    sha256 "97ac5927549ad3cda7e01e1a9f3ef857767629f7807e9ecb3d1c695dcdf2cd58"
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
