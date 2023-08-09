# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.2.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.1/consul-dataplane_1.2.1_darwin_amd64.zip"
    sha256 "201ba709d83b84695372de43f1087298bb7f1ff2b5273e21e7f2788be0a56278"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.1/consul-dataplane_1.2.1_darwin_arm64.zip"
    sha256 "bde7d9558fa29e1c0d4d1969a85bb63d1ba6d880b0f243ace5134d94aa13001e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.1/consul-dataplane_1.2.1_linux_amd64.zip"
    sha256 "7a236bca6c14a1dd4f46bf725f480b2cd715c2314cbf0b55ed4dad771dfb1e8c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.1/consul-dataplane_1.2.1_linux_arm.zip"
    sha256 "19c49e7f6a803b713595e119fb44361cc832fdeec18efc4f8a658b22341957c6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.1/consul-dataplane_1.2.1_linux_arm64.zip"
    sha256 "2bb90333e55ca70364c2268c11b3326594c35899f762010d71061163ea70e43c"
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
