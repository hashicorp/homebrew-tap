# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.32.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.32.0/consul-template_0.32.0_darwin_amd64.zip"
    sha256 "312a7a94677e212f3ee51b1e829734a40dce308f4e53a5cf1645b1a40c794492"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.32.0/consul-template_0.32.0_darwin_arm64.zip"
    sha256 "30dd5ca37133e60fc5d87ace5977c7d5185cd8303828a7ba607f86758ee02354"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.32.0/consul-template_0.32.0_linux_amd64.zip"
    sha256 "eda83e12a4618929a3ec0a49b11a2823b6201c9ae64e5a15161fd63313caf88b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.32.0/consul-template_0.32.0_linux_arm.zip"
    sha256 "2a2e398af41de2c6b79489ab795ec66d0d397868563944c4a1676e89a5d079a1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.32.0/consul-template_0.32.0_linux_arm64.zip"
    sha256 "e65bdd1a68a7d8f25be6de3ac2b7fc6b32f6b37131d1517ab0817327bfcd801f"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
