# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.34.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.34.0/consul-template_0.34.0_darwin_amd64.zip"
    sha256 "d0ae649b1bbe1382a8b6ed0252959bebbaf3f8edd28ae68d267056b0b0d3fae4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.34.0/consul-template_0.34.0_darwin_arm64.zip"
    sha256 "53b5b84f63487317a1ffde50fba1b92885656c195894a124006985d2957aae6f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.34.0/consul-template_0.34.0_linux_amd64.zip"
    sha256 "c7a5817547d6545f8c5ce2dfea62c821ddd324dd9a3414519ebaba2aeeff59a0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.34.0/consul-template_0.34.0_linux_arm.zip"
    sha256 "5a055fdbdd403b9e68c2ca457c543ebe0b4a4c9af498ff979b206107ced81eb6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.34.0/consul-template_0.34.0_linux_arm64.zip"
    sha256 "90638103f9558b6a152af7245b066472b1ad500332e23d4b6dca1a206f89f4d1"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
